#!/bin/sh

CONSOLE_COLOR_RED=31
CONSOLE_COLOR_GREEN=32
CONSOLE_COLOR_YELLOW=33
CONSOLE_COLOR_BLUE=34
CONSOLE_COLOR_MAGENTA=35
CONSOLE_COLOR_DEEP_GREEN=36
CONSOLE_COLOR_WHITE=37

console() {
    color=$2
    string=$1
    if [ ${color} == "" ]; then
        color=${CONSOLE_COLOR_WHITE}
    fi
    printf "\033[${color}m${string}\n\033[0m"
}

if [ "$JAVA_OPT" == "" ]; then
    JAVA_OPT="-Xms1G -Xmx2G"
fi
if [ "$VERSION" == "" ]; then
    VERSION="1.8.8"
fi

if [ "$PLAYER" == "" ]; then
    export PLAYER=10
fi

FILE=install.lock
DIR=/minecraft/${VERSION}
JAR=minecraft_server.${VERSION}.jar


if [ ! -d "$DIR" ]; then
    mkdir $DIR
fi
cd ${DIR}
console "Now at: $DIR" ${CONSOLE_COLOR_GREEN}

if [ ! -f "$FILE" ]; then
    console "Download version ${VERSION}" ${CONSOLE_COLOR_YELLOW}
    echo "eula=true" > eula.txt
    echo "[]" > usercache.json
    echo "[]" > banned-ips.json
    echo "[]" > banned-players.json
    echo "[]" > ops.json
    echo "[]" > whitelist.json
    rm ${JAR}
    wget http://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/minecraft_server.${VERSION}.jar
    console "Generating lock file..." ${CONSOLE_COLOR_YELLOW}
    date > ${FILE}
else
   console "Skip download using exists." ${CONSOLE_COLOR_YELLOW}
fi

envsubst '$PLAYER' < /server.properties.template > server.properties

cat server.properties

console "Java option: ${JAVA_OPT}" ${CONSOLE_COLOR_GREEN}

java ${JAVA_OPT} -jar ${JAR} nogui