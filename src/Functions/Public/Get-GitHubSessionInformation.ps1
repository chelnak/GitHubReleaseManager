function Get-GitHubSessionInformation {
<#
    .SYNOPSIS
    Private function to retrieve a sessionstate variable and check for it's existence

    .DESCRIPTION
    Private function to retrieve a sessionstate variable and check for it's existence

    .INPUTS
    None.

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Get-GitHubSessionInformation

#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param()

    Write-Verbose -Message "Retrieving GithubSessionInformation"

    if (!$Script:GitHubSessionInformation) {

        throw "The GithubSessionInformation does not exist. Run Set-GitHubSessionInformation first!"

    }

    Write-Output $Script:GitHubSessionInformation

}