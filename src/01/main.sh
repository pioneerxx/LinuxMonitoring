#!/bin/bash
re="^[+-]?[0-9]+([.][0-9]+)?$"
if [ $# \< 1 ]; then
	echo "Empty input";
elif [ $# \> 1 ]; then
	echo "Incorrect input";
elif  [[ $1 =~ $re ]]; then
	echo "Incorrect input";
else
	chmod +x print.sh
	bash print.sh $1
fi
