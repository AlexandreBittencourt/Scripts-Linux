#!/bin/bash

cd /apache-log/

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
    then
        echo "O endereço Ip não está presente no arquivo"
    fi
else
    echo "Formato não é válido"
fi
