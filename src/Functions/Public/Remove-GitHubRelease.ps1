function Remove-GitHubRelease {
<#
    .SYNOPSIS
    Remove a release

    .DESCRIPTION
    Remove a release

    .PARAMETER Id
    The Id of the release to remove

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Remove-GitHubRelease -Id 12345

    .EXAMPLE
    Get-GitHubRelease -Id 12345 | Remove-GitHubRelease

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [String[]]$Id

    )

    Begin {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

    }

    Process {

        try {

            foreach ($ReleaseId in $Id) {

                if ($PSCmdlet.ShouldProcess($SessionInfo.Repository)){

                    $URI = "/repos/$($SessionInfo.Username)/$($SessionInfo.Repository)/releases/$($ReleaseId)"
                    Invoke-GitHubRestMethod -Method DELETE -URI $URI -Verbose:$VerbosePreference

                }

            }

        }
        catch [Exception] {

            throw $_

        }

    }

    End {}

}