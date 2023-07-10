#This script requires a third-party module and may not be suitable for all environments.

# Get the local users
$LocalUsers = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount='True'" | Select-Object Name, FullName, Description, Disabled, Lockout

# Get the path to the current user's home directory
$HomePath = $env:USERPROFILE

# Create the full path to where the Excel file will be saved
$ExcelPath = Join-Path -Path $HomePath -ChildPath 'LocalUsers.xlsx'

# Export to Excel
$LocalUsers | Export-Excel -Path $ExcelPath -TableName LocalUsersTable -TableStyle Medium10 -AutoSize -FreezeTopRow
