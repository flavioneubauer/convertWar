#!/bin/bash

WAR_PATH="$1"
CONTEXTO="$2"
TMP_PATH=".tmp_war"

rm -rf $TMP_PATH

if [ -f $WAR_PATH ];
then
   echo "File $WAR_PATH encontrado."
else
   echo "Arquivo não encontrado."
   echo "Uso: ./convertWar.sh audi-web-core.war contexto"
   exit -1
fi

if [ "$CONTEXTO" != "" ];
then
   echo "Criando novo war no contexto $CONTEXTO"
else
   echo "Contexto não encontrado"
   echo "Uso: ./convertWar.sh audi-web-core.war contexto"
   exit -1
fi

unzip $WAR_PATH -d $TMP_PATH > /dev/null

cd $TMP_PATH
rm WEB-INF/jboss-classloading.xml WEB-INF/jboss-web.xml

jar cvf ../$CONTEXTO.war *
