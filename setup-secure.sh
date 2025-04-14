#!/bin/bash

echo "Mise à jour de la VM..."
sudo apt update && sudo apt upgrade -y

# 2. Configurer le fuseau horaire (France)
echo "[+] Configuration du fuseau horaire sur Europe/Paris..."
sudo timedatectl set-timezone Europe/Paris
echo "[+] Fuseau horaire actuel : $(timedatectl | grep 'Time zone')"

echo "Installation de UFW (pare-feu)..."
sudo apt install -y ufw
sudo ufw allow OpenSSH
sudo ufw enable

echo "Installation de fail2ban..."
sudo apt install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Affichage automatique du log check-secure à chaque connexion
BASHRC_LINE='echo -e "\n--- État de sécurité (check-secure) ---"; tail -n 20 /var/log/check-secure.log; echo -e "--- Fin du rapport automatique ---\n"'

if ! grep -Fxq "$BASHRC_LINE" ~/.bashrc; then
    echo "$BASHRC_LINE" >> ~/.bashrc
    echo "[+] Affichage automatique de check-secure.log ajouté à ~/.bashrc"
else
    echo "[*] L'affichage automatique est déjà présent dans ~/.bashrc"
fi


echo "Sécurisation terminée."
