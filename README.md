# 🚀 Nginx Proxy Manager Deployment & Management Guide

![Docker](https://img.shields.io/badge/Docker-2026-blue?style=for-the-badge&logo=docker)
![Nginx Proxy Manager](https://img.shields.io/badge/Nginx_Proxy_Manager-Latest-brightgreen?style=for-the-badge&logo=nginx)
![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)
![Visitor Count](https://komarev.com/ghpvc/?username=sohag1192-NginxProxyManager&color=007ec6&style=for-the-badge&label=VISITORS)

---

🌐 **Language / ভাষা**: [🇬🇧 English](#-english-documentation) | [🇧🇩 বাংলা](#-বাংলা-ডকুমেন্টেশন)

---

<a name="-english-documentation"></a>
# 🇬🇧 English Documentation

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
To quickly stage, commit, and push repository updates to GitHub:
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

---

<a name="-বাংলা-ডকুমেন্টেশন"></a>
# 🇧🇩 বাংলা ডকুমেন্টেশন

## ⚡ দ্রুত এক-লাইনের স্বয়ংক্রিয় ইনস্টলেশন
যদি আপনার একটি ফ্রেশ Debian/Ubuntu সার্ভার থাকে, তাহলে নিচের কমান্ডটি রান করে স্বয়ংক্রিয়ভাবে ইনস্টল করতে পারেন:

```bash
curl -fsSL https://raw.githubusercontent.com/sohag1192/NginxProxyManager/main/install-npm.sh | sudo bash
```

---

## 🛠️ ম্যানুয়াল ইনস্টলেশন পদ্ধতি

### ১. ডকার (Docker) ও ডকার কম্পোজ ইনস্টল করুন
```bash
sudo apt update
sudo apt install ca-certificates curl gnupg -y

# Docker এর অফিশিয়াল GPG কি যুক্ত করুন
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Docker রিপোজিটরি যুক্ত করুন
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Docker প্যাকেজসমূহ ইনস্টল করুন
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# বর্তমান ইউজারকে docker গ্রুপে যুক্ত করুন
sudo usermod -aG docker $USER
```

---

### ২. রিপোজিটরি ক্লোন ও কনটেইনার চালুকরণ

```bash
git clone https://github.com/sohag1192/NginxProxyManager.git
cd NginxProxyManager/
docker compose pull
docker compose up -d
```

চলমান কনটেইনার চেক করুন:
```bash
docker ps -a
```

---

## 🔄 বিদ্যমান কনটেইনার এবং সিস্টেম আপডেট নির্দেশিকা

### ধাপ ১: সার্ভারের সিস্টেম প্যাকেজ আপডেট করুন (ঐচ্ছিক)
```bash
sudo apt update && sudo apt upgrade -y
```

### ধাপ ২: প্রোজেক্ট ডিরেক্টরিতে যান
```bash
cd NginxProxyManager/   # অথবা /opt/nginx-proxy-manager
```

### ধাপ ৩: সর্বশেষ ডকার ইমেজ নামান (Pull)
Nginx Proxy Manager এর নতুন সংস্করণ নামাতে:
```bash
docker compose pull
```

### ধাপ ৪: আপডেটেড ইমেজ দিয়ে কনটেইনার পুনরায় চালুকরণ
নতুন ইমেজ দিয়ে কনটেইনার চালু করুন (কয়েক সেকেন্ড ডাউনটাইম হতে পারে):
```bash
docker compose up -d
```

### ধাপ ৫: পুরাতন অব্যবহৃত ইমেজ ডিলিট করুন (ঐচ্ছিক)
ডিস্ক স্পেস খালি করতে পুরাতন ডকার ইমেজ রিমুভ করুন:
```bash
docker image prune -f
```

---

## 📤 অটো আপলোড ফিচার (Windows)
GitHub রিপোজিটরিতে দ্রুত কোড Commit ও Push করার জন্য `upload.bat` ব্যবহার করুন:
```cmd
upload.bat "আপনার কাজের মেসেজ লিখুন"
```

---

## 💾 ডাটা সুরক্ষা ও পারসিস্টেন্স
আপনার তৈরি করা તમામ প্রক্সি হোস্ট, এসএসএল সার্টিফিকেট এবং ইউজার ডাটা নিচের ফোল্ডারে সংরক্ষিত থাকে:
- `./data` - ওয়েব প্রক্সি কনফিগারেশন এবং ডাটাবেস ফাইল
- `./letsencrypt` - SSL সার্টিফিকেট এবং রিনিউয়াল ডাটা

কনটেইনার আপডেট বা রিস্টার্ট করলেও **কোনো ডাটা মুছে যাবে না**।

---

## ✅ ওয়েব ইন্টারফেস অ্যাক্সেস ও লগইন

কনটেইনার চালু হওয়ার পর ব্রাউজারে গিয়ে ওপেন করুন:

```
http://<your-server-ip>:81
```

**ডিফল্ট লগইন তথ্য:**
- **ইমেইল:** `admin@example.com`
- **পাসওয়ার্ড:** `changeme`

> ⚠️ *নোট: প্রথমবার লগইন করার সাথে সাথেই আপনাকে নতুন ইমেইল ও পাসওয়ার্ড সেট করতে বলা হবে।*
