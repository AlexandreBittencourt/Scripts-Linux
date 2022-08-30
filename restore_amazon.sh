#!/bin/bash

CAMINHO_RESTORE=/home/user/restore_multillidae_amazon

aws s3 sync s3://curso-shell-script/$(date +%F) $CAMINHO_restore


cd $CAMINHO_RESTORE

if [ -f $1.sql ]
then
    mysql -u root multilliadae < $1.sql
    if [ $? -eq 0 ]
    then
         echo "O Restore da tabela foi realizado com sucesso!"
    fi
else
    echo "O arquivo procurado não existe no diretório!"
fi

