#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" adm.multilidae.com<<del
Houve um problema no servidor e os usuários pararam de ver conteúdos web.
del
    systemctl restart apache2
fi 
