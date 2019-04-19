#!/bin/bash


while read  line;do
 config=("${config[@]}" $line) 
done < "$1"
lines=${#config[@]}
servers=`expr $lines - 2`
if [ $2 -lt `expr $servers + 1` ];then
  
echo -e  "yes\n${config[lines-1]}" | sudo openconnect ${config[`expr $2-1`]} --user=${config[lines-2]}
else
echo "you added $servers servers"
fi

