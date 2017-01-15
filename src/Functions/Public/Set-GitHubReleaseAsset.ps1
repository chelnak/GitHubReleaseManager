function Set-GitHubReleaseAsset {
<#
    .SYNOPSIS
    Set information about an asset

    .DESCRIPTION
    Set information about an asset

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The id of the asset

    .PARAMETER Name
    The name of the asset

    .PARAMETER Label
    An alternate short description of the asset. Used in place of the filename.

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Set-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Name NewName

    .EXAMPLE
    Set-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Label NewLabel

    .EXAMPLE
    Set-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Name NewName -Label NewLabel

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [String]$Id,

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory=$false, Position=3)]
        [ValidateNotNullOrEmpty()]
        [String]$Label

    )

    try {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

        $Body = [PSCustomObject] @{
            name = $Name
        }

        if ($PSBoundParameters.ContainsKey("Label")){

            $Body | Add-Member -MemberType NoteProperty -Name label -Value $Label

        }

        if ($PSCmdlet.ShouldProcess($Id)){

            $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/assets/$($Id)"
            Invoke-GitHubRestMethod -Method PATCH -URI $URI -Body ($Body | ConvertTo-Json) -Verbose:$VerbosePreference

        }

    }
    catch [Exception]{

        throw $_.Exception

    }

}