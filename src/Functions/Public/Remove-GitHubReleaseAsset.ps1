function Remove-GitHubReleaseAsset {
<#
    .SYNOPSIS
    Remove an asset from a release

    .DESCRIPTION
    Remove an asset from a release

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The id of the asset

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Rempve-GitHubReleaseAsset -Repository MyRepository -Id xxxx

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [String[]]$Id

    )

    Begin {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

    }

    Process {

        try {

            foreach ($AssetId in $Id) {

                if ($PSCmdlet.ShouldProcess($Id)){

                    Write-Verbose -Message "Removing asset $($AssetId)"
                    $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/assets/$($AssetId)"
                    Invoke-GitHubRestMethod -Method DELETE -URI $URI -Verbose:$VerbosePreference

                }

            }

        }
        catch [Exception]{

            throw $_.Exception

        }

    }

    End {}

}