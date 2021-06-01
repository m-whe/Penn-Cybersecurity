#!/bin/bash

# Filepaths
fPaths=(
    "/etc/shadow"
    "/etc/passwd"
)

# Loop over fPaths
for path in "${fPaths[@]}";
do
  #ls -al $path
  echo "$path: " $(stat -c "%a %A" $path)
done


# echo $path
