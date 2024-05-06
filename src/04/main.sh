#bin/bash

if [[ $# > 0 ]]
then
        echo "Incorrect input"
        exit
fi

while read PARAM; do
    colors[$i]="$(echo $PARAM | sed 's|.*=||')"
    i=$(($i+1))
done < ./settings.config

for i in "${!colors[@]}";
do
        if [[ ${colors[$i]} != "" && ${colors[$i]} != [1-6] ]];
        then
                echo "Parameters must be 1-6 values."
                exit
        fi
done

if ([[ ${colors[0]} == ${colors[1]} ]] && ! [[ ${colors[0]} == "" ]]) || \
   ([[ ${colors[2]} == ${colors[3]} ]] && ! [[ ${colors[0]} == "" ]]) || \
   ([[ ${colors[0]} == "" ]] && [[ ${colors[1]} == "6" ]]) || \
   ([[ ${colors[2]} == "" ]] && [[ ${colors[3]} == "6" ]]) || \
   ([[ ${colors[1]} == "" ]] && [[ ${colors[0]} == "1" ]]) || \
   ([[ ${colors[3]} == "" ]] && [[ ${colors[1]} == "1" ]]);
then
        echo "Backcolor and forecolor of a column must not match"
        exit
fi

chmod +x print.sh
bash print.sh ${colors[0]} ${colors[1]} ${colors[2]} ${colors[3]}
