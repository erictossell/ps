
$InstalledApps = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Where-Object {$_.DisplayName -ne $null} |
                Select-Object DisplayName, DisplayVersion, Publisher

foreach ($app in $InstalledApps) {
    Write-Output "Name: $($app.DisplayName)"
    Write-Output "Version: $($app.DisplayVersion)"
    Write-Output "Publisher: $($app.Publisher)"
    Write-Output "----------------------"
}
