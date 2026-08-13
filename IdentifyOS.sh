#!/bin/bash

# colors

BLACK='\033[30m' # ${BLACK}${RST}
RED='\033[31m'	# ${RED}${RST}
GREEN='\033[32m' # ${GREEN}${RST}
YELLOW='\033[33m' # ${YELLOW}${RST}
BLUE='\033[34m' # ${BLUE}${RST}
WHITE='\033[97m' # ${WHITE}${RST}
RST='\033[0m'

# Take the TTL number from a ICMP packet

ipTTL=$(ping $1 -c 1 | awk 'NR>1{print $6}' | head -n 1 | grep -oE '[0-9]+')

# classification of the OS based on the TTL number retrieved

if (( $ipTTL >= 0 && $ipTTL <= 255 )); then

	if (( $ipTTL >= 50 && $ipTTL <= 75 )); then
	  echo -e "${WHITE}-----------------------------${RST}"
	  echo -e " This is a ${GREEN}GNU/Linux${RST} Machine"
	  echo -e "         TTL > ${GREEN}$ipTTL${RST}"
	  echo -e "${WHITE}-----------------------------${RST}"
	fi
	
	if (( $ipTTL >= 110 && $ipTTL <= 135 )); then
	  echo -e "${WHITE}-----------------------------${RST}"
          echo -e "  This is a ${GREEN}Windows${RST} Machine"
          echo -e "         TTL > ${GREEN}$ipTTL${RST}"
	  echo -e "${WHITE}-----------------------------${RST}"
    fi
	
else
echo "do you even know if this thing is working on?"
fi
