#!/bin/sh
echo "eula=true" >> eula.txt
java $JAVA_OPT -jar /minecraft/minecraft_server.${VERSION}.jar nogui