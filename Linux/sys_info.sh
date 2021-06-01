#!/bin/bash

echo "A system audit script. Executing sys_info.sh...
" >> ~/research/sys_info.txt

echo "Today's date is: $(date)
" >> ~/research/sys_info.txt

echo "User: $USER
" >> ~/research/sys_info.txt

echo "Machine IP Address: $(hostname -I | awk '{print $1}')
" >> ~/research/sys_info.txt

echo "Host Name: $(hostname)
" >> ~/research/sys_info.txt

echo "DNS Info:
$(cat /etc/resolv.conf | tail -2)
" >> ~/research/sys_info.txt

echo "Memory Usage:
$(free)
" >> ~/research/sys_info.txt

echo "CPU Info:
$(head /proc/cpuinfo)
" >> ~/research/sys_info.txt

echo "Disk Usage:
$(du -h | head)
" >> ~/research/sys_info.txt

echo "User Logins:
$(w)
" >> ~/research/sys_info.txt
