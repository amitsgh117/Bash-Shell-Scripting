#!/bin/bash

if [ -f $1 ] && [ -f $2 ]; then

while read line1
do
	while read line2
	do
		if [ -z $line1 ] || [ -z $line2 ]; then
			continue
		fi
		if [ $line1 == $line2 ]; then
			echo $line1
		fi
	done < $2
done < $1

else 
	echo "File doesnot exists"
fi
