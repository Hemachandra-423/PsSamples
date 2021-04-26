using namespace System.Management.Automation.Host
    $A = [ChoiceDescription]::new('&Diskspace', 'A')
    $B = [ChoiceDescription]::new('&Portscheck', 'B')
    $C = [ChoiceDescription]::new('&fils check', 'C')
    $Envs = [ChoiceDescription[]]($A,$B,$C) 
    $choice = $host.ui.PromptForChoice("Select Environment", "Enter the below Choice", $envs, 0) 
    switch ($choice) 
    {
    0
    { 
    Write-Host "`nYou have selected a Disk space check" 
    $scriptpath = "C:\Users\hemac\OneDrive\Desktop\GitHub\DiskSpaceUtilization.ps1"
    Invoke-Expression -Command $scriptpath
    } 
    1
    { Write-Host "`nYou have selected Port check Option" } 
    2
    { Write-Host "`nYou have selected file check option" }
    
    }
