function Set-GitHubSessionInformation {
<#
    .SYNOPSIS
    Create information for this session

    .DESCRIPTION
    Create information for this session

    .PARAMETER Repository
    The repository to manage

    .PARAMETER Username
    The username that has priveleges to manage the repository

    .PARAMETER APIKey
    The personal access token associated with the username

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Set-GitHubSessionInformation -Repository TestRepo -Username user -APIKey xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [String]$Username,

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [String]$APIKey

    )

    Write-Verbose -Message "Creating new SessionState variable GithubSessionInformation"

    $EncodedAuth = [System.Text.Encoding]::UTF8.GetBytes("$($Username):$($APIKey)")

    $GithubSessionInformation = [PSCustomObject]@{

        Repository = $Repository
        Username = $Username
        Authorization = [System.Convert]::ToBase64String($EncodedAuth)

    }

    try {

        if ($PSCmdlet.ShouldProcess("GithubSessionInformation")){

            $PSCmdlet.SessionState.PSVariable.Set("GithubSessionInformation", $GithubSessionInformation)

        }

    } catch {

        throw $_

    }

    Write-Output $GithubSessionInformation

}