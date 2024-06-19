#!/bin/bash

# Variables
PAPER_VERSION="1.20.6"
BUILD_URL=$(curl -s https://api.papermc.io/v2/projects/paper/versions/${PAPER_VERSION} | jq -r '.builds[-1]')
DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/${PAPER_VERSION}/builds/${BUILD_URL}/downloads/paper-${PAPER_VERSION}-${BUILD_URL}.jar"
wget -O paper.jar $DOWNLOAD_URL

# Accept the EULA
echo "eula=true" > eula.txt

# Create plugins directory
mkdir -p plugins

# Download plugins
wget -O plugins/Chunky.jar https://cdn.modrinth.com/data/fALzjamp/versions/6ENKPUbu/Chunky-1.4.10.jar
wget -O plugins/Dynmap.jar https://cdn.modrinth.com/data/fRQREgAc/versions/CeFY2xAD/Dynmap-3.7-beta-5-spigot.jar

# Start the server
java -Xms1G -Xmx2G -jar paper.jar --nogui
