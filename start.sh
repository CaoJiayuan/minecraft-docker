#!/bin/sh
echo "eula=true" >> eula.txt

if [ "$VERSION" == "" ]; then
    VERSION="1.8.8"
fi

if [ "$JAVA_OPT" == "" ]; then
    JAVA_OPT="-Xms1G -Xmx2G"
fi

echo "Downloading mincraft ${VERSION}"
wget http://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar
java $JAVA_OPT -jar /minecraft/minecraft_server.${VERSION}.jar nogui