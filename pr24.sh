#!/usr/bin/env bash
set -e

echo "[*] Update package list..."
sudo apt-get update

echo "[*] Install base dependencies..."
sudo apt-get install -y \
  wget curl unzip git python3-pip \
  libatk1.0-0t64 \
  libatk-bridge2.0-0t64 \
  libcups2t64 \
  libxkbcommon0 \
  libatspi2.0-0t64 \
  libxdamage1 \
  libasound2t64 \
  libnss3 \
  libxshmfence1 \
  libxcomposite1 \
  libxrandr2 \
  libgbm1 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libgtk-3-0

# Install Node.js 22.x (tanpa reinstall npm global)
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

# Inisialisasi proyek dan install Playwright (lokal, bukan global)
if [ ! -f package.json ]; then
  npm init -y
fi
npm install playwright

# Install Firefox untuk Playwright
npx playwright install firefox
# (Opsional) jika masih ada dependency yang kurang di OS, jalankan baris di bawah:
# sudo npx playwright install-deps

echo "[*] Done! Playwright siap dengan Firefox."
echo "[*] Contoh jalanin test: npx playwright test --project=firefox (jika pakai @playwright/test)."
