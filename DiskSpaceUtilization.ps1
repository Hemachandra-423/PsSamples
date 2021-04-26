#[CmdletBinding()]
#    Param(
#        [Parameter(Mandatory = $True, Position = 1)]
#        [string]$computername #   )

Write-Host -ForegroundColor Green "Hi $env:UserName.... Please wait While i gather the information you need"
foreach($computername in $computers)
{
    $disks = Get-WmiObject -ComputerName $computers -Class Win32_LogicalDisk -Filter "DriveType = 3";
    Write-Output ("you are currently looking at {0} `with {1} Drives " -f $computers, $disks.Count);
    $yesNo = Read-Host -Prompt 'Do you want to display the disk information completely? Y/N: '

  if($yesNo -eq'Y'){
            $dtype = @{
            2 = "Removable disk" 
            3=  "Fixed local disk"
            4=  "Network disk"
            5 = "CD/DVD disk"}
         Get-CimInstance Win32_LogicalDisk |  Select-Object DeviceID,  
         @{N="DiskType"; E={$dtype.Item([int]$_.DriveType)}},
         @{N="Total Size(GB)"; E={[math]::Round(($_.Size/1GB),2)}}, 
         @{N="Free Space(GB)";E={[math]::Round(($_.FreeSpace/1GB),2)}}| Format-Table -auto }
       
        else {
            Write-output "You have selected 'No' please try again"
             }
}
    