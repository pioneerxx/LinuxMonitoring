#!/bin/bash

forecolor() {
        case ${1} in
                1) echo "\033[37m";;
                2) echo "\033[31m";;
                3) echo "\033[32m";;
                4) echo "\033[34m";;
                5) echo "\033[35m";;
                6) echo "\033[30m";;
                "") echo "\033[37m";;
        esac
}

backcolor() {
        case ${1} in
                1) echo "\033[47m";;
                2) echo "\033[41m";;
                3) echo "\033[42m";;
                4) echo "\033[44m";;
                5) echo "\033[45m";;
                6) echo "\033[40m";;
                "") echo "\033[40m";;
        esac
}

whichcolor() {
        case ${1} in
                1) echo "1 (white)";;
                2) echo "2 (red)";;
                3) echo "3 (green)";;
                4) echo "4 (blue)";;
                5) echo "5 (purple)";;
                6) echo "6 (black)";;
                "") if [[ $2 == "forecolor"  ]];
                    then
                        echo "default (white)"
		    else
                        echo "default (black)"
                    fi
        esac
}

resetcolor="\033[0m"
backcolor1=$(backcolor "$1")
forecolor1=$(forecolor "$2")
backcolor2=$(backcolor "$3")
forecolor2=$(forecolor "$4")

echo -e "${forecolor1}${backcolor1}HOSTNAME${resetcolor} = ${forecolor2}${backcolor2}$(hostname)${resetcolor}"
echo -e "${forecolor1}${backcolor1}TIMEZONE${resetcolor} = ${forecolor2}${backcolor2}$(timedatectl | grep 'zone' | awk '{print $3" "$4" "$5}')${resetcolor}"
echo -e "${forecolor1}${backcolor1}USER${resetcolor} = ${forecolor2}${backcolor2}$(whoami)${resetcolor}"
echo -e "${forecolor1}${backcolor1}OS${resetcolor} = ${forecolor2}${backcolor2}$(cat /etc/issue | awk '{print $1 $2 $3}')${resetcolor}"
echo -e "${forecolor1}${backcolor1}DATE${resetcolor} = ${forecolor2}${backcolor2}$(date | awk '{print $3" "$2" "$6" "$4}')${resetcolor}"
echo -e "${forecolor1}${backcolor1}UPTIME${resetcolor} = ${forecolor2}${backcolor2}$(uptime | awk '{print $3}' | sed 's/,//')${resetcolor}"
echo -e "${forecolor1}${backcolor1}UPTIME_SEC${resetcolor} = ${forecolor2}${backcolor2}$(awk '{print $1}' /proc/uptime)${resetcolor}"
echo -e "${forecolor1}${backcolor1}IP${resetcolor} = ${forecolor2}${backcolor2}$(ip a | grep 'enp0s3$' | awk '{print $2}' | sed 's/\/24//')${resetcolor}"
echo -e "${forecolor1}${backcolor1}MASK${resetcolor} = ${forecolor2}${backcolor2}$(netstat -r | head -4 | awk '{print $3}' | tail -n 1)${resetcolor}"
echo -e "${forecolor1}${backcolor1}GATEWAY${resetcolor} = ${forecolor2}${backcolor2}$(ip r | grep 'default' | awk '{print $3}')${resetcolor}"
echo -e "${forecolor1}${backcolor1}RAM_TOTAL${resetcolor} = ${forecolor2}${backcolor2}$(cat /proc/meminfo | grep 'MemTotal' | awk '{printf "%.3f", $2/1024/1024}') GB${resetcolor}"
echo -e "${forecolor1}${backcolor1}RAM_USED${resetcolor} = ${forecolor2}${backcolor2}$(free | grep 'Mem' | awk '{printf "%.3f", $3/1024/1024}') GB${resetcolor}"
echo -e "${forecolor1}${backcolor1}RAM_FREE${resetcolor} = ${forecolor2}${backcolor2}$(free | grep 'Mem' | awk '{printf "%.3f", $4/1024/1024}') GB${resetcolor}"
echo -e "${forecolor1}${backcolor1}SPACE_ROOT${resetcolor} = ${forecolor2}${backcolor2}$(df | grep '/$' | awk '{printf "%.2f", $2/1024}') MB${resetcolor}"
echo -e "${forecolor1}${backcolor1}SPACE_ROOT_USED${resetcolor} = ${forecolor2}${backcolor2}$(df | grep '/$' | awk '{printf "%.2f", $3/1024}') MB${resetcolor}"
echo -e "${forecolor1}${backcolor1}SPACE_ROOT_FREE${resetcolor} = ${forecolor2}${backcolor2}$(df | grep '/$' | awk '{printf "%.2f", $4/1024}') MB${resetcolor}"

echo "Column 1 background = $(whichcolor "$1" "")"
echo "Column 1 font color = $(whichcolor "$2" "forecolor")"
echo "Column 2 background = $(whichcolor "$3" "")"
echo "Column 2 font color = $(whichcolor "$4" "forecolor")"
