while ($true) {
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "Time: $time"
    
    docker exec puffcoin-node1 ./puffcoind getblockcount
    docker exec puffcoin-node1 ./puffcoind getbalance
    docker exec puffcoin-node2 ./puffcoind getbalance

    Write-Host "------------------------------`n"
    Start-Sleep -Seconds 10
}