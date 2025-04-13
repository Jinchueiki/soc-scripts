#!/bin/bash

echo "🔄 Mise à jour de la VM..."
sudo apt update && sudo apt upgrade -y

echo "🧱 Installation de UFW (pare-feu)..."
sudo apt install -y ufw
sudo ufw allow OpenSSH
sudo ufw enable

echo "🔐 Installation de fail2ban..."
sudo apt install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "✅ Sécurisation terminée."
