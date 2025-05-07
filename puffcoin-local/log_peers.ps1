$lastPeers = @()

while ($true) {
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $peers = docker exec puffcoin-node1 ./puffcoind getpeerinfo | ConvertFrom-Json
    $currentPeers = $peers.addr

    $newPeers = $currentPeers | Where-Object { $_ -notin $lastPeers }

    foreach ($peer in $newPeers) {
        Write-Host "$time - New peer connected: $peer"
        Add-Content -Path peers_log.txt -Value "$time - New peer connected: $peer"
    }

    $lastPeers = $currentPeers
    Start-Sleep -Seconds 10
}
