Ce projet est sous licence [Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/). 

## Introduction

Ces scripts sont ma base pour me faciliter la vie sur ma Debian. Ils sont en place dans bien d'autres machines que les miennes car j'en ai déjà partagé la plupart à d'autres instants de ma vie. J'ai décidé pour simplifier les choses de faire de ce dépôt mon backup principal pour, et me simplifier les choses, et faciliter le partage de mes scripts.

## Base commune entre les scripts

Hormis quelques scripts très courts, la plupart des scripts ont la même base:
```sh
#!/bin/bash
# root: y

grey="\\e[1;90m"
red="\\e[1;91m"
green="\\e[1;92m"
orange="\\e[1;93m"
blue="\\e[1;94m"
purple="\\e[1;95m"
cyan="\\e[1;96m"
white="\\e[1;97m"
end="\\e[0;0m"

############
```

Le plus important étant la 2ème ligne qui permet de savoir si ce script nécessite d'être exécuté en root ou pas.

## Explications par scripts

- `generate_env.sh` : permet de générer le code à ajouter au bashrc en fonction des droits nécessaires à l'exécution de chaque script
- `utilities/container/container_creator` : permet de créer des conteneurs LUKS qui me permettent de stocker des informations sensibles à la manière de VeraCrypt
- `utilities/container/container_mounter` : permet de monter mes conteneurs en semi-automatique
- `utilities/install/install_repositories` : permet d'installer des dépôts tierces
- `utilities/packages/zip_extract` : permet d'extraire des archives
- `utilities/packages/zip_create` : permet de créer des archives
- `utilities/network/connect_ethernet_terminal` : permet de se connecter en LAN sans interface graphique
- `utilities/network/connect_wifi_terminal` : permet de se connecter en Wifi sans interface graphique
- `utilities/vps/simple_auth_generator` : permet de générer un fichier .htpasswd avec le code .htaccess correspondant
- `utilities/converter/convert_ts_to_mp4` : permet de convertir un fichier de .ts à .mp4
- `utilities/converter/convert_message_to_qrcode` : permet de générer un qrcode à partir de texte brut
- `utilities/converter/convert_mkv_to_mp4` : permet de convertir un fichier de .mkv à .mp4
- `utilities/converter/convert_pdf_to_images` : permet de convertir un fichier de .pdf à .png
- `utilities/converter/convert_mp4_to_audio` : permet de convertir un fichier de .mp4 à .mp3
- `utilities/converter/convert_binary_to_shellcode` : permet de convertir un fichier de .bin à .raw
- `utilities/delete/delete_pip_modules` : permet de supprimer les packages pip locaux
- `utilities/delete/delete_iptables_rules` : permet de réinitialiser la configuration iptables
- `utilities/image/image_convert` : permet de convertir un fichier de .png à .jpeg et vice versa 
- `utilities/image/image_resize_percent` : permet de modifier la taille d'une image en utilisant des pourcentages
- `utilities/image/image_to_ico` : permet de convertir un fichier de .png à .ico
- `utilities/image/image_resize` : permet de modifier la taille d'une image
- `utilities/clean/clean_title` : permet de supprimer certains caractères spéciaux gênants dans les titres de fichiers
- `utilities/clean/clean_chromium` : permet d'effacer les artéfacts pour chromium
- `utilities/clean/clean_firefox` : permet d'effacer les artéfacts pour firefox
- `utilities/patch/patch_unmanaged_network_devices` : permet de corriger un bug présent sur certaines debian testing où l'icône de NetworkManager est cassée
- `utilities/patch/patch_crypto_luks_blob` : permet d'ajouter la dépendance pour monter une partition LUKS
- `utilities/patch/patch_gnome_wayland_error` : permet de remplacer wayland par xorg
- `utilities/patch/patch_create_symlink_libcurl_to_local` : permet de corriger un bug en créant un lien symbolique pour libcurl
- `utilities/web/clone_website` : permet de sauvegarder un site web en local
- `utilities/web/download_zscaler_client_connector` : permet de télécharger le client zscaler
- `utilities/web/download_virtualbox_guest_iso` : permet de télécharger l'iso guest pour VirtualBox
- `security/harden/harden_modules_starting_alone` : permet de désactiver certains modules qui peuvent causer des problèmes d'anonymat
- `security/harden/harden_hostnamectl` : permet de définir à quel type de device correspond le système
- `security/harden/harden_firefox` : permet la mise en place d'une configuration renforcée pour Firefox, que ce soit au niveau sécurité, qu'anonymat
- `security/harden/harden_machineid` : permet de randomiser au démarrage l'ID machine
- `security/harden/harden_permanent_mac` : permet de randomiser au démarrage les adresses MAC
- `security/harden/harden_version` : permet de randomiser au démarrage la version OS
- `security/harden/harden_bios` : permet de randomiser au démarrage les informations DMI
- `security/harden/harden_permanent_hostname` : permet de randomiser au démarrage le nom d'hôte
- `security/harden/mullvad/configuration.txt` : fichier contenant la liste des adresses IP pour Mullvad
- `security/harden/mullvad/mullvad_killswitch` : permet la mise en place du killswitch pour Mullvad
- `security/harden/mullvad/mullvad_openvpn_list_ip` : permet de récupérer la liste des IP Mullvad pour OpenVPN via l'API
- `security/harden/harden_dconf` : permet d'améliorer l'hardening et l'anonymat via certains paramètres dconf
- `security/harden/harden_usb` : permet de mettre en place une configuration pour lutter contre Rubber Ducky et équivalents
- `security/harden/harden_kernel` : permet de mettre en place une configuration du noyau au niveau système pour lutter contre des attaques bas niveau ou réseau
- `security/detect/detect_backdoor_pdf` : permet de détecter le niveau de malveillance d'un fichier PDF
- `security/delete/delete_docx_data` : permet de supprimer les meta-données d'un fichier .docx, et incorpore une fonction de génération de fausses données
- `security/delete/delete_flac_data` : permet de supprimer les meta-données d'un fichier .flac
- `security/delete/delete_mp3_data` : permet de supprimer les meta-données d'un fichier .mp3
- `security/delete/delete_recommends` : permet de supprimer l'ajout des paquets suggérés et recommendés par apt
- `security/delete/delete_metadata` : permet de supprimer les meta-données de multiples extensions
- `security/delete/delete_empty` : permet de supprimer les fichiers vides
- `security/wipe/wipe_hdd` : permet d'effacer de manière sécurisée le contenu d'un HDD
- `security/wipe/wipe_ssd` : permet d'effacer de manière sécurisée le contenu d'un SSD
- `security/changer/change_tor_exitnode` : permet de modifier l'exit node utilisé en choisissant le pays de son choix
- `security/changer/change_luks_key` : permet de modifier la clé LUKS de dévérouillage

## Remarques

1. Ce dépôt n'intégrera **pas** mes scripts offensifs mais vous pourriez en trouver mentions ci et là. 