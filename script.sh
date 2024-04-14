#!/bin/bash
FILE="$1"
LINE_NO="$2"
i=0
while read line; do
i=$((i+1)
test $i=$LINE_NO && echo "$line";
done <"$FILE"

