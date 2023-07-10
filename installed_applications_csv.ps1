
$InstalledApps = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                Where-Object {$_.DisplayName -ne $null} |
                Select-Object DisplayName, DisplayVersion, Publisher

# Get the path to the current user's home directory
$HomePath = $env:USERPROFILE

# Create the full path to where the CSV file will be saved
$CsvPath = Join-Path -Path $HomePath -ChildPath 'InstalledApps.csv'

# Export to CSV
$InstalledApps | Export-Csv -Path $CsvPath -NoTypeInformation

