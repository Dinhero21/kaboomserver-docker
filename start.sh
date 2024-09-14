#!/bin/sh

# This script is supposed to run in the docker container

cd /server

# taken from https://github.com/kaboomserver/framework/blob/99e84a8a33c83422a2aee730e9c20a9cce0e3aba/script/server.sh#L46-L47
RAM="${RAM:-1700M}"

INIT_RAM="${INIT_RAM:-$RAM}"
MAX_RAM="${MAX_RAM:-$RAM}"

# 🤤 Aikar's Flags
java \
  -Xms$INIT_RAM -Xmx$MAX_RAM \
  --add-modules=jdk.incubator.vector \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem \
  -XX:MaxTenuringThreshold=1 \
  -Dusing.aikars.flags=https://mcflags.emc.gs \
  -Daikars.new.flags=true \
  -XX:G1NewSizePercent=30 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=20 \
  -jar server.jar \
  --nogui
