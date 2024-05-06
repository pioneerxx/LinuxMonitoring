#bin/bash

if [[ $# = 0 ]]
then
	chmod +x print.sh
        res=$(bash print.sh)
	echo "$res"
        echo -n "Save the output? "
        read feedback
        if [[ $feedback = 'y' || $feedback = 'Y' ]]
        then
                echo "$res" > $(date "+%d_%m_%Y_%H_%M_%S").status
        fi
else
        echo "Incorrect input"
fi
