# 🚀 Nginx Proxy Manager Deployment & Management Guide

![Docker](https://img.shields.io/badge/Docker-2026-blue?style=for-the-badge&logo=docker)
![Nginx Proxy Manager](https://img.shields.io/badge/Nginx_Proxy_Manager-Latest-brightgreen?style=for-the-badge&logo=nginx)
![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)
[![Visitor Count](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fsohag1192%2FNginxProxyManager&count_bg=%23007EC6&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Hits%2FViews&edge_flat=false)](https://hits.seeyoufarm.com)

---

## ⚡ Quick One-Line Automated Installation
If you are on a fresh Debian/Ubuntu server, you can run the automated setup script directly:

```bash
curl -fsSL https://raw.githubusercontent.com/sohag1192/NginxProxyManager/main/install-npm.sh | sudo bash
```

---

## 🛠️ Manual Step-by-Step Installation

### 1. Install Docker & Docker Compose
```bash
sudo apt update
sudo apt install ca-certificates curl gnupg -y

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Install Docker packages
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add current user to docker group
sudo usermod -aG docker $USER
```

---

### 2. Clone Repository & Deploy

```bash
git clone https://github.com/sohag1192/NginxProxyManager.git
cd NginxProxyManager/
docker compose pull
docker compose up -d
```

Check running status:
```bash
docker ps -a
```

---

## 🔄 Updating Your Existing Container & System

### Step 1: Update Host System Packages (Optional)
```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Navigate to Project Directory
```bash
cd NginxProxyManager/   # or /opt/nginx-proxy-manager
```

### Step 3: Pull Latest Docker Images
Fetch the newest image build for Nginx Proxy Manager:
```bash
docker compose pull
```

### Step 4: Re-create Container with Updates
Restart container with updated images (minimal downtime):
```bash
docker compose up -d
```

### Step 5: Clean Up Old Docker Images (Optional)
Remove redundant old Docker image layers to free up server disk space:
```bash
docker image prune -f
```

---

## 📤 Auto Upload Changes (Windows)
To quickly stage, commit, and push any repository updates to GitHub:
```cmd
upload.bat "Your commit message here"
```

---

## 💾 Data Persistence & Safety
All configuration settings, custom proxy hosts, users, and Let's Encrypt SSL certificates are stored in host volumes:
- `./data` - Web proxy configuration & database files
- `./letsencrypt` - SSL Certificates and renewal data

Updating, stopping, or recreating containers **will NOT lose any data**.

---

## ✅ Access Nginx Proxy Manager Web UI

Once the container is running, open your web browser and navigate to:

```
http://<your-server-ip>:81
```

**Default Credentials:**
- **Email:** `admin@example.com`
- **Password:** `changeme`

> ⚠️ *Note: You will be prompted to change your email and password immediately after your first login.*
