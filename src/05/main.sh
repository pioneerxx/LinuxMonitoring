#!/bin/bash

cor='.*/$'
start="$(date +%s.%N)"

if [[ $# != 1 ]]; then
        echo "Incorrect input"
        exit
fi

if ! [[ -d $1 ]]; then
        echo "Incorrect parameter"
        exit
fi

if ! [[ $1 =~ $cor ]]; then
        echo "Incorrect parameter"
        exit
fi

chmod +x print.sh
bash print.sh $1 $start
