while ($true) {
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "Time: $time"

    $blockcount = docker exec puffcoin-node1 ./puffcoind getblockcount
    $balance1 = docker exec puffcoin-node1 ./puffcoind getbalance
    $balance2 = docker exec puffcoin-node2 ./puffcoind getbalance
    $peers = docker exec puffcoin-node1 ./puffcoind getpeerinfo | ConvertFrom-Json
    $peerCount = $peers.Count

    Write-Host "Block Height: $blockcount"
    Write-Host "Balance Node 1: $balance1"
    Write-Host "Balance Node 2: $balance2"
    Write-Host "Connected Peers: $peerCount"

    foreach ($peer in $peers) {
        Write-Host " - " $peer.addr
    }

    Write-Host "------------------------------`n"
    Start-Sleep -Seconds 10
}
