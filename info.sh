#!/bin/bash

#o usuario deve ter privilegios de root

echo INFORMACOES DO CPU >> info.txt
cat /proc/cpuinfo | grep "model name" >> info.txt

echo INFORMACOES DA MEMORIA >> info.txt
cat /proc/meminfo | grep "MemTotal" >> info.txt
sudo dmidecode | grep -i "Maximum Capacity:" | uniq >> info.txt
sudo lshw -class memory | awk '/bank/ {count++} END {print "You have " count " slots for RAM"}' >> info.txt

echo INFORMACOES DA PLACA MAE >> info.txt
sudo dmidecode | grep Product >> info.txt

echo INFORMACOES DA PLACA DE VIDEO >> info.txt
lspci | grep VGA >> info.txt
