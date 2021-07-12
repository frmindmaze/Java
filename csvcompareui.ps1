Function Select-File {
    $openFileDialog = New-Object System.windows.forms.openfiledialog   
    $openFileDialog.initialDirectory = [System.IO.Directory]::GetCurrentDirectory()   
    $openFileDialog.title = "Select CSV File to Import"   
    $openFileDialog.filter = "All files (*.*)| *.*"   
    $openFileDialog.filter = "All Files|*.*" 
    $openFileDialog.ShowHelp = $True
    Write-Host "Select Weekly IAVM CSV File ... (see FileOpen Dialog)" -ForegroundColor Green  
    $result = $openFileDialog.ShowDialog()   # Display the Dialog / Wait for user response 
    $result 
    if($result -eq "OK")    {    
            Write-Host "Selected Weekly IAVM CSV File:"  -ForegroundColor Green  
            Return ($OpenFileDialog.Filename)
           
            Write-Host "Import CSV Imported!" -ForegroundColor Green 
        } 
        else { Write-Host "Import CSV File Cancelled!" -ForegroundColor Yellow} 
}

$inputfile1 = $OpenFileDialog.Filename
$inputfile2 = $OpenFileDialog.Filename
Import-Csv $inputfile1
Import-Csv $inputfile2
Compare-Object $inputfile1 $inputfile2 -IncludeEqual | Where {$_.SideIndicator -eq "=="} | Export-csv C:\users\Administrator\Desktop\test1.csv -NoTypeInformation