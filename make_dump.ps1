$dump = Get-Location
$file = $dump.path + '\dump_db.sql'
Set-Location 'C:\Program Files\PostgreSQL\15\bin'
./pg_dump -U postgres -W -E UTF8 -d oprosnik -f $file