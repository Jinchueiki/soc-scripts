#!/bin/bash

LOGFILE="/var/log/check-secure.log"
DATE=$(date)

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

log "===== Vérification de la sécurisation de la VM - $DATE ====="

# Vérifier si UFW est actif
if sudo ufw status | grep -q "Status: active"; then
    log "UFW est actif."
else
    log "UFW est inactif !"
fi

# Vérifier que le port SSH est bien autorisé
if sudo ufw status | grep -q "OpenSSH"; then
    log "Le port SSH (OpenSSH) est autorisé par le pare-feu."
else
    log "ATTENTION : Le port SSH n'est pas autorisé !"
fi

# Vérifier que fail2ban est actif
if systemctl is-active --quiet fail2ban; then
    log "Fail2ban est actif."
else
    log "Fail2ban est inactif !"
fi

# Vérifier les mises à jour disponibles
UPDATES=$(apt list --upgradable 2>/dev/null | grep -v "Listing" | wc -l)
if [ "$UPDATES" -gt 0 ]; then
    log "$UPDATES mise(s) à jour disponible(s)."
else
    log "Aucune mise à jour disponible."
fi

# Vérifier que root SSH est désactivé
if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config; then
    log "L'accès SSH root est désactivé (bon)."
else
    log "ATTENTION : L'accès SSH root est autorisé !"
fi

log "===== Fin de la vérification ====="

