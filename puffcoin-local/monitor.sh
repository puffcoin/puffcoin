#!/bin/bash
while true; do
  echo "Time: $(date)"
  docker exec puffcoin-node1 ./puffcoind getblockcount
  docker exec puffcoin-node1 ./puffcoind getbalance
  docker exec puffcoin-node2 ./puffcoind getbalance
  echo "-----------"
  sleep 10
done