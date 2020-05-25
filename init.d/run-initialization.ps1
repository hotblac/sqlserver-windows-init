$cmd = $args

######################
# Start initialization
######################
Write-Host "Starting SQL Server for initialization"
start-service MSSQL`$SQLEXPRESS

if($sa_password -ne "_")
{
    Write-Verbose "Changing SA login credentials"
    $sqlcmd = "ALTER LOGIN sa with password='$($env:sa_password)';ALTER LOGIN sa ENABLE;"
    & sqlcmd -Q $sqlcmd
}

Write-Host "Running initialization script"
sqlcmd -S localhost -U sa -P $env:sa_password -d master -i c:\init.d\create-database.sql

Write-Host "SQL Server initialized. Stopping..."
stop-service MSSQL`$SQLEXPRESS
####################
# End initialization
####################


Write-Host "Running command: $($cmd)"
Invoke-Expression -Command "$cmd"
# or...
# cmd.exe /c "$cmd"
