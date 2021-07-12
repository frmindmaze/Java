## Ref_ID,First_Name,Last_Name,DOB
#$csv1 = @'
#321364060,User1,Micah,11/01/1969
#946497594,User2,Acker,05/28/1960
#887327716,User3,Aco,06/26/1950
#588496260,User4,John,05/23/1960
#565465465,User5,Jack,07/08/2020
#56534565,User6,Jack,09/08/2020
#56788465,User7,Jack,07/06/2020
#56895465,User8,Jack,07/04/2020
#'@
#
## First_Name,Last_Name,DOB,City,Document_Type,Filename
#$csv2 = @'
#User1,Micah,11/01/1969,Parker,Transcript,T4IJZSYO.pdf
#User2,Acker,05/28/1960,,Transcript,R4IKTRYN.pdf
#User3,Aco,06/26/1950,,Transcript,R4IKTHMK.pdf
#User4,John,05/23/1960,,Letter,R4IKTHSL.pdf
#'@

$sideacsv= Import-Csv .\Desktop\Sidea
$sidebcsv = Import-Csv .\Desktop\Sideb
$sidebfinalcsv= '.\Desktop\merged\final.csv'
$CSV = Get-ChildItem -Path $sidebcsv -Filter *.csv | ForEach-Object { 
    Import-Csv -Path $_
}

$CSV | Export-Csv -Path $sidebfinalcsv -NoTypeInformation -Force;




# hashtable
$data = @{}

$c1 = $csv1 -split "`r`n"
$c1.count

foreach ($item in $c1)
{
    $fields = $item -split ','
    $key = $fields[1]+$fields[2]+$fields[3]
    $key

    # add new hashtable for given key
    $data.Add($key, [ordered]@{})

    # add data from c1 to the hashtable
    $data[$key].PassengerId = $fields[0]
    $data[$key].First = $fields[1]
    $data[$key].Last = $fields[2]
    $data[$key].DOB = $fields[3]
}

$c2 = $csv2 -split "`r`n"
$c2.count

foreach ($item in $c2)
{
    $fields = $item -split ','
    $key = $fields[0]+$fields[1]+$fields[2]
    $key

    # add data from c2 to the hashtable
    $data[$key].Type = $fields[4]
    $data[$key].FileName = $fields[5]
}

$data.Count

foreach ($key in $data.Keys)
{
    '====================='
    $data[$key]
    }