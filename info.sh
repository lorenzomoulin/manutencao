#!/bin/bash

#o usuario deve ter privilegios de root

echo INFORMACOES DO CPU >> info.txt
cat /proc/cpuinfo | grep "model name" >> info.txt

echo INFORMACOES DA MEMORIA >> info.txt
cat /proc/meminfo | grep "MemTotal" >> info.txt

echo INFORMACOES DA PLACA MAE >> info.txt
sudo dmidecode | grep Product >> info.txt

echo INFORMACOES DA PLACA DE VIDEO >> info.txt
lspci | grep VGA >> info.txt
