#!/bin/bash

if [ -f $1 ]; then
	
	awk -F ',' '$2 > 30 && $16 > 0 {print $0}' $1 > $2

else
	echo "File doesnot exists"
fi
