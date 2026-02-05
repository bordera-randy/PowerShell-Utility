$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
while ($timer.Elapsed.TotalSeconds -lt 10) {
    ## Do some stuff here
    ## Wait a specific interval
    Start-Sleep -Seconds 1
    ## Check the time
    $totalSecs =  [math]::Round($timer.Elapsed.TotalSeconds,0)
    $totalSecs
}