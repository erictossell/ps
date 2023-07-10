
# Get the local users
$LocalUsers = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount='True'"

# Get the path to the current user's home directory
$HomePath = $env:USERPROFILE

# Create the full path to where the CSV file will be saved
$CsvPath = Join-Path -Path $HomePath -ChildPath 'LocalUsers.csv'

# Export to CSV
$LocalUsers | Select-Object Name, FullName, Description, Disabled, Lockout, PasswordRequired, PasswordChangeable, PasswordExpires, Status | Export-Csv -Path $CsvPath -NoTypeInformation
