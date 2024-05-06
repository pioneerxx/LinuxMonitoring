#bin/bash

forecolor() {
        case ${1} in
                1) echo "\033[37m";;
                2) echo "\033[31m";;
                3) echo "\033[32m";;
                4) echo "\033[34m";;
                5) echo "\033[35m";;
                6) echo "\033[30m";;
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
        esac
}

if [[ $# != 4 ]]
then
        echo "Incorrect input"
        exit
fi

for param in "$@"
do
        if [[ $param != [1-6] ]]
        then
                echo "Parameters must be 1-6 values"
                exit
        fi
done

if [[ $1 = $2 || $3 = $4 ]]
then
        echo "Forecolor and backcolor of a column must not match. Please restart the script"
        exit
fi

backcolor1=$(backcolor "$1")
forecolor1=$(forecolor "$2")
backcolor2=$(backcolor "$3")
forecolor2=$(forecolor "$4")

chmod +x print.sh
bash print.sh $forecolor1 $backcolor1 $forecolor2 $backcolor2
