#!/bin/bash
for ((i = 0 ; i < 200 ; i++)); do
    echo $i
    echo ""
    ironfish deposit --confirm -v
    sleep $[ (180 + $RANDOM % 10 ) ]s
    echo ""
done
