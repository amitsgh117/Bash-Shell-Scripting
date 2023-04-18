#!/bin/bash

if [ -f $1 ]; then

        tail -n +2 $1 > q3_no_header.csv
        sort -r -k16,16 -n -t, q3_no_header.csv > q3_sorted.csv

        head -n 1 $1 > $2

        awk -v x="$(awk -F ',' '{print $16}' q3_sorted.csv | uniq | sed -n '10p')" -F ',' '{
        if ($16 >= x)
                {
                        print $0;
                }
        }' q3_sorted.csv >> $2

else
        echo "File doesnot exists"
fi
