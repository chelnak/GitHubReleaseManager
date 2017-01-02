function Remove-GitHubRelease {
<#
    .SYNOPSIS
    Remove a release

    .DESCRIPTION
    Remove a release

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The Id of the release to remove

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Remove-GitHubRelease -Repository MyRepository -Id 12345

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

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

            foreach ($ReleaseId in $Id) {

                if ($PSCmdlet.ShouldProcess($Repository)){

                    $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/$($ReleaseId)"
                    Invoke-GitHubRestMethod -Method DELETE -URI $URI -Verbose:$VerbosePreference

                }

            }

        }
        catch [Exception] {

            throw $_.Exception

        }

    }

    End {}

}