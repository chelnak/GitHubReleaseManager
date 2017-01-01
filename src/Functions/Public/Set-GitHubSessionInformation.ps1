function Set-GitHubSessionInformation {
<#
    .SYNOPSIS
    Create information for this session

    .DESCRIPTION
    Create information for this session

    .PARAMETER Username
    The username that has priveleges to manage the repository

    .PARAMETER APIKey
    The personal access token associated with the username

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Set-GitHubSessionInformation -Username user -APIKey xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [String]$Username,

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [String]$APIKey

    )

    Write-Verbose -Message "Creating new SessionState variable GithubSessionInformation"

    try {

        if ($PSCmdlet.ShouldProcess("GithubSessionInformation")){

            $EncodedAuth = [System.Text.Encoding]::UTF8.GetBytes("$($Username):$($APIKey)")

            $Script:GithubSessionInformation = [PSCustomObject]@{

                Username = $Username
                Authorization = [System.Convert]::ToBase64String($EncodedAuth)

            }

        }

    } catch {

        throw $_.Exception

    }

    Write-Output $Script:GithubSessionInformation

}