## Sommaire
- [🎯 Objectif](#objectif)
- [🧱 Architecture](#architecture)
- [🛠 Technologies utilisées](#technologies-utilisées)
- [⚙ Fonctionnalités](#fonctionnalités)
- [📚 Ce que j'ai appris](#ce-que-jai-appris)
- [🚀 Améliorations futures](#améliorations-futures)


SOC Cloud Personnel avec Wazuh et Suricata

Ce projet consiste à déployer un environnement de supervision de sécurité (SOC) dans le cloud en utilisant Wazuh en mode all-in-one, Suricata pour la détection réseau, et Oracle Cloud Infrastructure pour l'hébergement des machines virtuelles.

----------------------------------------------------------------- Objectif ---------------------------------------------------------------------------------

Mettre en place un SOC cloud minimaliste permettant :

La supervision d'une machine victime grâce à Wazuh Agent

La détection de comportements suspects (scan Nmap, brute force SSH)

L'intégration de Suricata pour la détection réseau

L'affichage des alertes dans le dashboard Wazuh

--------------------------------------------------------------- Architecture -------------------------------------------------------------------------------

Deux VMs Ubuntu 22.04 hébergées sur Oracle Cloud :

SIEM (Manager) : Wazuh all-in-one, collecte des logs, dashboard

Machine victime (Agent) : générateur d'événements (scan, SSH, etc.), Suricata actif

Communication entre les machines via IP privée et ports ouverts (1514, 1515, 55000).

----------------------------------------------------------- Technologies utilisées -------------------------------------------------------------------------

Oracle Cloud (gratuite 1 mois)

Ubuntu Server 22.04

Wazuh (manager + agent)

Suricata (IDS)

iptables (firewall)

nmap (test de scan)

-------------------------------------------------------------- Fonctionnalités -----------------------------------------------------------------------------

Supervision des événements de sécurité

Remontée d'alertes dans Wazuh Dashboard

Détection de :

Scan Nmap

Tentatives SSH invalides

Logs réseau via Suricata

Création de règles personnalisées Wazuh (ex : scan, SSH bruteforce)

------------------------------------------------------------- Ce que j'ai appris ---------------------------------------------------------------------------

Mise en place d'un SOC Cloud de A à Z

Déploiement et configuration de Wazuh Manager et Agent

Analyse d'événements de sécurité

Gestion du pare-feu avec iptables

Intégration d'un IDS (Suricata) au SIEM

------------------------------------------------------------ Améliorations futures ------------------------------------------------------------------------

Finaliser l'intégration de Kibana/Elasticsearch

Ajouter Grafana/Prometheus pour le monitoring

Tester l'envoi de logs vers un serveur externe

Ajouter d'autres types d'attaques (reverse shell, DoS, etc.)

Automatiser le déploiement avec Ansible
