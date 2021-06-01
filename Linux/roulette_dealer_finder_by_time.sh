#!/bin/bash

# roulette_dealer_finder_by_time.sh

# Prompts the user to input a date (MMDD) and time (00:00:00 AM/PM)
# to find a roulette dealer at the Lucky Duck Casino.

#####ARGS

read -p 'Date: ' DATE
read -p 'Time: ' TIME

FILE="${DATE}_Dealer_schedule"

#####MAIN

grep -i "$TIME" "$FILE" | awk '{ print $1,$2,$5,$6 }'


#####NOTES

#grep -i "03:00:00 AM" 0315_Dealer_schedule
#grep -i "03:00:00 a" 0315_Dealer_schedule

#echo $DATE
#echo $TIME

#DATE=0315
#TIME=03:00

