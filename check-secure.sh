#!/bin/bash

echo "Vérification de la sécurisation de la VM..."

echo -e "\n Vérification du pare-feu UFW :"
sudo ufw status verbose

echo -e "\n Vérification du service Fail2Ban :"
sudo systemctl status fail2ban | grep "Active:"

echo -e "\n Vérification des mises à jour disponibles :"
sudo apt update > /dev/null
sudo apt upgrade -s | grep "upgraded"

echo -e "\n Vérification terminée."
