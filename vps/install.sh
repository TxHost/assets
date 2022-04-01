cat << "EOF"
       _____    _   _           _   
      |_   _|  | | | |         | |  
        | |_  _| |_| | ___  ___| |_ 
        | \ \/ /  _  |/ _ \/ __| __|
        | |>  <| | | | (_) \__ \ |_ 
        \_/_/\_\_| |_/\___/|___/\__|

     Discord : https://discord.txhost.fr
          Site : https://txhost.fr
            
            TxHost © 2021 - 2022                          
EOF
supported="Ubuntu (20.04), Debian (10, 11)"
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
COLOR3='\33[0;33m'
NC='\033[0m'                                                #no color

 if [ "$(id -u)" != "0" ]; then
         printf "${RED}ERREUR : Tx-FiveM  n'a pas accès root. ⛔️\\n" 1>&2
         printf "\\n"
         exit 1
 fi
    printf "${COLOR1}   ©️ Copyright Tous droits réservés TXHOST ©️ \\n"
    printf "${COLOR2}  💻 Systèmes pris en charge : $supported 💻\\n"
    printf "${NC}\\n"    
    sleep 5
#############################################################################
#Installation prérequis
echo
    printf "${COLOR3} Souhaitez-vous créer une installation automatique di serveur VPS ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion du serveur VPS!"
    apt update
    apt upgrade -y
    apt install bash curl wget nload htop sudo neofetch -y
    wget https://raw.githubusercontent.com/TxHost/assets/main/vps/.bashrc
    source .bashrc
    cd /etc/
    rm /etc/motd
    wget https://raw.githubusercontent.com/TxHost/assets/main/vps/motd
    source motd

    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config;systemctl restart ssh

    printf "${NC}\\n"   
    printf "${COLOR1}✔️ Installation terminée  [o/N]\\n"
fi