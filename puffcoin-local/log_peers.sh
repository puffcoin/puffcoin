#!/bin/bash
LAST_PEERS=""

while true; do
  TIME=$(date '+%Y-%m-%d %H:%M:%S')
  CURRENT_PEERS=$(docker exec puffcoin-node1 ./puffcoind getpeerinfo | jq -r '.[].addr')

  for PEER in $CURRENT_PEERS; do
    if ! grep -q "$PEER" <<< "$LAST_PEERS"; then
      echo "$TIME - New peer connected: $PEER"
      echo "$TIME - New peer connected: $PEER" >> peers_log.txt
    fi
  done

  LAST_PEERS="$CURRENT_PEERS"
  sleep 10
done
