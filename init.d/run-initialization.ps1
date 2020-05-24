$cmd = $args
Write-Host "Do stuff"

Write-Host "Running command: $($cmd)"
Invoke-Expression -Command "$cmd"
# or...
# cmd.exe /c "$cmd"
