#!/bin/bash

caminho_home=/home/user

cd $caminho_home

if [ ! -d backup ]
then
    mkdir backup
fi


mysqldump -u root $1 > $caminho_home/backup/$1.sql

if [ $? -eq 0 ]
then
    echo "Backup foi realizado com sucesso"
else
    echo "Houve um problema com o backup"
fi
