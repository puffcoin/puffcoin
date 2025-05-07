#!/bin/bash
while true; do
  echo "Time: $(date)"
  echo -n "Block Height: "
  docker exec puffcoin-node1 ./puffcoind getblockcount
  echo -n "Balance Node 1: "
  docker exec puffcoin-node1 ./puffcoind getbalance
  echo -n "Balance Node 2: "
  docker exec puffcoin-node2 ./puffcoind getbalance
  echo -n "Connected Peers: "
  peer_count=$(docker exec puffcoin-node1 ./puffcoind getpeerinfo | jq length)
  echo "$peer_count"
  echo "Peer IPs:"
  docker exec puffcoin-node1 ./puffcoind getpeerinfo | jq -r '.[].addr'
  echo "------------------------------"
  sleep 10
done
