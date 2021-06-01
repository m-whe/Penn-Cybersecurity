#!/bin/bash

# roulette_dealer_finder_by_time.sh

# Prompts the user to input a date (MMDD), time (00:00:00 AM/PM),
# and casino game (string) to find a dealer at the Lucky Duck Casino.

#####ARGS

read -p 'Date: ' DATE
read -p 'Time: ' TIME
read -p 'Casino Game: ' GAME

FILE="${DATE}_Dealer_schedule"

#####MAIN

shopt -s nocasematch

case $GAME in
  "Blackjack")
    grep -i "$TIME" "$FILE" | awk '{ print $1,$2,$3,$4 }'
    ;;

  "Roulette")
    grep -i "$TIME" "$FILE" | awk '{ print $1,$2,$5,$6 }'
    ;;

  "Texas Hold Em")
    grep -i "$TIME" "$FILE" | awk '{ print $1,$2,$7,$8 }'
    ;;

  *)
    echo -n "This game doesn't exist at the Lucky Duck Casino."
    ;;
esac



#####NOTES

#grep -i "$TIME" "$FILE" | awk '{ print $1,$2,$5,$6 }'

#grep -i "03:00:00 AM" 0315_Dealer_schedule
#grep -i "03:00:00 a" 0315_Dealer_schedule

#echo $DATE
#echo $TIME

#DATE=0315
#TIME=03:00

