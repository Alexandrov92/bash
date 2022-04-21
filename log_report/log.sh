#!/bin/bash
#--------------
# created by Alexandrov
# Реализация скрипта в Bash 
#------------
SUB_LOG="$(grep '/canbus/chassis' $1)" #фильтр по параметру 'channel'
while IFS= read -r LINE
do 
SB="$(echo "$LINE" | grep -oP '\[\K[^]]*' | tr '\n' '_')" #выделяем значения параметров символом '_'
#присваиваем переменным значение каждого параметра
CHANNEL="$(echo "$SB" | cut -d'_' -f 1)" 
DROP_MSG="$(echo "$SB" | cut -d'_' -f 2)"
P_INDEX="$(echo "$SB" | cut -d'_' -f 3)"
C_INDEX="$(echo "$SB" | cut -d'_' -f 4)"
echo "$CHANNEL $DROP_MSG $P_INDEX-$C_INDEX" >> result.log #вывод результата на экран или в файл*
echo " " 
done <<< $SUB_LOG # передаём в цикл 
