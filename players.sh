#!/bin/bash

if [ -f $1 ]; then

        awk -F ',' 'BEGIN { OFS = "," } {
            if ($7 == "position") $48="position_no";
            if ($7 == "Goalkeeper") $48=3;
            if ($7 == "Defender") $48=2;
            if ($7 == "Midfielder") $48=1;
            if ($7 == "Forward") $48=0;
            print $0;
        }' $1 > q4_numbered.csv

        tail -n +2 q4_numbered.csv > q4_no_header.csv
        sort -r -k16,16 -k48,48 -n -t, q4_no_header.csv > q4_sorted.csv

        awk -F ',' 'BEGIN { OFS = "," } {print $1, $12, $7, $16}' q4_numbered.csv | head -n 1 > $2

        awk -F ',' 'BEGIN { OFS = "," } {print $1, $12, $7, $16}' q4_sorted.csv >> $2

else
        echo "File doesnot exists"
fi
