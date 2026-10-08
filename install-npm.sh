#!/bin/bash
set -e

# Ensure the script is run with sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit 1
fi

echo "Updating Debian system packages..."
apt update && apt upgrade -y

# Install Docker if it is not already installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    apt install -y ca-certificates curl gnupg
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt update
    apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "Docker is already installed. Skipping..."
fi

echo "Setting up Nginx Proxy Manager directory structure..."
NPM_DIR="/opt/nginx-proxy-manager"
mkdir -p "$NPM_DIR"
cd "$NPM_DIR"

echo "Generating docker-compose.yml..."
cat <<EOF > docker-compose.yml
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80'     # Public HTTP Port
      - '443:443'   # Public HTTPS Port
      - '81:81'     # Admin Web Port
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOF

echo "Starting Nginx Proxy Manager container..."
docker compose up -d

echo ""
echo "======================================================="
echo "✅ Nginx Proxy Manager installed and running!"
echo "======================================================="
echo "Access the Admin UI at: http://<your-server-ip>:81"
echo ""
echo "Default Login Credentials:"
echo "Email:    admin@example.com"
echo "Password: changeme"
echo "======================================================="
echo "Note: You will be prompted to change these immediately upon first login."
