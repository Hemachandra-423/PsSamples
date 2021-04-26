[CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, Position = 1)]
        [String]$computername)

foreach($computers in $computername)
{
$computers=$computername

Write-Host -ForegroundColor Green "Hi $env:UserName.... Please wait untill i test the connection" 
#$Credential = Get-Credential
$ipV4=Test-Connection -ComputerName $computers -ErrorAction Ignore
#$ipV4= Enter-PSSession –ComputerName $computers -ErrorAction Continue

if(!$ipV4){

Write-Output "Cannot connect Please try again"

}
else{

    Write-Host -ForegroundColor yellow "Connection was succesful "
    
    Try
        {

         Write-Host -ForegroundColor yellow "You are now connected to the remote server $machineName choose one of the following"
         #$machineName= $computers
         $scriptpath = "C:\Users\hemac\OneDrive\Desktop\GitHub\Choice.ps1"
         Invoke-Expression -Command $scriptpath
        }
     Catch
        {
        $ErrorMsg = $_.Exception.Message
        Write-Warning "Failed to validate credentials: $ErrorMsg ,Please try again"
        Pause
        Break
    }


}

}