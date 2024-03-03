$spore = Get-Process -Name "SporeApp";
$wshell = New-Object -ComObject WScript.Shell;
Add-Type -AssemblyName System.Windows.Forms

while ($spore) {
    Start-Sleep 1800 #Change this value to change how long the increments between saves are
    $wshell.AppActivate($spore.Id)
    Start-Sleep 1
    $wshell.SendKeys('{`}')
    $InputBox = [System.Windows.Forms.MessageBox]::Show("The game is about to save. Do you want to continue?", "Confirmation", [System.Windows.Forms.MessageBoxButtons]::YesNo)
    if ($InputBox -eq "Yes") {
        $wshell.AppActivate($spore.Id)
        Start-Sleep 1
        $wshell.SendKeys("^{s}")
    }
} 