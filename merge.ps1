$sideacsv= import-csv -Path D:\Sidea
$sidebcsv = Import-Csv -Path D:\Sideb
$sidebfinalcsv= 'D:merged\final.csv'
$CSV = Get-ChildItem -Path $sidebcsv -Filter *.csv | ForEach-Object { 
    Import-Csv -Path $_
}

$CSV | Export-Csv -Path $sidebfinalcsv -NoTypeInformation -Force;