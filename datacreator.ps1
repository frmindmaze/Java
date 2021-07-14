Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select a Datasheet'
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75, 120)
$okButton.Size = New-Object System.Drawing.Size(75, 23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150, 120)
$cancelButton.Size = New-Object System.Drawing.Size(75, 23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10, 20)
$label.Size = New-Object System.Drawing.Size(280, 20)
$label.Text = 'Please select application name to generate datasheet'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10, 40)
$listBox.Size = New-Object System.Drawing.Size(260, 20)
$listBox.Height = 80

$excel = new-object -com excel.application
$wb = $excel.workbooks.open("C:\Users\frmin\Documents\Mapping.xlsx")
$excel.visible = $false
Start-Sleep -Seconds 0
$excel.displayAlerts = $false # don't prompt the user
for ($i = 1; $i -le $wb.sheets.count; $i++) {
    $sheetname = $wb.Sheets.Item($i).Name;
    [void] $listBox.Items.Add($sheetname)
    $sheetname
}

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $selectedapplication = $listBox.SelectedItem
    $sheet = $wb.Sheets |
    Where-Object Name -eq $selectedapplication |
    Select-Object -First 1
    $tempCsv = New-TemporaryFile
    $sheet.SaveAs($tempCsv, 6)
    $sheetData = Get-Content $tempCsv | ConvertFrom-Csv
    $out = 'C:\Users\frmin\Documents\TestDataInput1.xls'
    $wb1 = $excel.workbooks.open("C:\Users\frmin\Documents\Masterdata.xls")
    $mainSheet = @()
    $filterSheet = @()
    $sheettohide = @()
    foreach ($sheet in $wb1.sheets) {
        $mainSheet += $sheet.Name
    }

    foreach ($sheetcol in $sheetData) {
        $filterSheet += $sheetcol.Sheetnames
    }
 
    $sheettohide = $mainSheet | select -Unique | where { $filterSheet -notcontains $_ }
    $sheettohide  
    foreach ($hidesheet in $sheettohide) {

        foreach ($sheet in $wb1.sheets) {
            if ($sheet.Visible -eq -1 -and $sheet.Name -eq $hidesheet) {
     
                $sheet.Visible = 0
                 
                if ($sheet.Visible -ne -1) {
                    Write-Host "sheet <"$sheet.Name"> now made hidden"
                }
                else {
                    Write-Host "Unable to change visibility"
                }
 
            }
        }
    }
    $wb1.CheckCompatibility = $false
    $wb1.SaveAs($out, 56)
    $wb1.Close($false)
}



