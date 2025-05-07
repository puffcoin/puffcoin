PuffCoin Docker Network - README
================================

This setup lets you run one or more PuffCoin nodes locally or connect them to the global network.

FILES
-----
- docker-compose.yml        - Defines services for multiple PuffCoin nodes
- Dockerfile                - Builds the PuffCoin node from source
- node1/puffcoin.conf       - Configuration file for node1
- node2/puffcoin.conf       - Configuration file for node2
- monitor.sh / monitor.ps1  - Realtime monitoring scripts
- log_peers.sh / log_peers.ps1 - Peer connection logger scripts

SETUP
-----
1. Extract this archive:
   > unzip puffcoin-local.zip
   > cd puffcoin-local

2. Build and launch the nodes:
   > docker-compose up --build -d

3. Check status:
   > docker exec puffcoin-node1 ./puffcoind getinfo
   > docker exec puffcoin-node1 ./puffcoind getpeerinfo

4. Monitor blocks and balance:
   Linux/macOS: ./monitor.sh
   Windows:     ./monitor.ps1

5. Log new peer connections:
   Linux/macOS: ./log_peers.sh
   Windows:     ./log_peers.ps1

NETWORKING
----------
To accept external connections (global network participation):

- In puffcoin.conf:
    listen=1
    discover=1
    externalip=YOUR_PUBLIC_IP

- In docker-compose.yml:
    ports:
      - "8857:8857"

- On your host (Windows), open port 8857 in the firewall:
    PowerShell (Admin):
    > New-NetFirewallRule -DisplayName "PuffCoin 8857" -Direction Inbound -Protocol TCP -LocalPort 8857 -Action Allow

- On your router, forward port 8857 to your machine's local IP.

TESTING FROM OUTSIDE
--------------------
From another machine:
   > telnet YOUR_PUBLIC_IP 8857

Or use:
   https://canyouseeme.org

TROUBLESHOOTING
---------------
- Block height = 0? Mining is running, but no peers or confirmation yet.
- Balance = 0? Block rewards require 100 confirmations.
- No inbound peers? Check firewall, router, and if externalip is configured.

Have fun building your own blockchain!
