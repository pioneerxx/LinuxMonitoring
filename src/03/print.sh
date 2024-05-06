#!/bin/bash

resetcolor="\033[0m"
forecolor1=$1
backcolor1=$2
forecolor2=$3
backcolor2=$4

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

