#!/bin/bash

caminho_backup=/home/user/_backup_multillidae_amazon

cd $caminho_backup

data=$($date +%F)

if [! -d $data ]
then
    mkdir $data
fi

tabelas=$(mysql -u root multillidae -e "show tables;" | grep -v Tables)

for tabela in $tabelas
do
    mysqldump -u root multillidae $tabelas > $caminho_backup/$data/$tabelas.sql
done

aws s3 sync $caminho_backup s3://curso/shell/script
