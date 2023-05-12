$dump = Get-Location
$file = $dump.path + '\dump_db.sql'
Set-Location 'C:\Program Files\PostgreSQL\15\bin'
./psql -U postgres -c 'DROP DATABASE oprosnik;'
./psql -U postgres -c 'CREATE DATABASE oprosnik;'
./psql -U postgres -d oprosnik -f $file
$shell = New-Object -ComObject Wscript.Shell
$shell.popup("Success!")