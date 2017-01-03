function Get-GitHubReleaseAsset {
<#
    .SYNOPSIS
    Get a list of assets for a release

    .DESCRIPTION
    Get a list of assets for a release

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The id of the release

    .PARAMETER Page
    The page number to return

    .PARAMETER PerPage
    The number of entries per page

    .INPUTS
    System.String
    System.Int

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Get-GitHubReleaseAsset -Repository MyRepository -ReleaseId xxxx

    .EXAMPLE
    Get-GitHubRelease -Repository MyRepository -Id xxxxx

    .EXAMPLE
    Get-GitHubRelease -Repository MyRepository -Tag v.1.0

    .EXAMPLE
    Get-GitHubRelease -Repository MyRepository -Latest

#>
[CmdletBinding(DefaultParameterSetName="Standard")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$true, Position=1, ParameterSetName="Standard")]
        [ValidateNotNullOrEmpty()]
        [String]$ReleaseId,

        [Parameter(Mandatory=$true, Position=2, ParameterSetName="ById")]
        [ValidateNotNullOrEmpty()]
        [String[]]$Id,

        [Parameter(Mandatory=$false, Position=3, ParameterSetName="Standard")]
        [ValidateNotNullOrEmpty()]
        [Int]$Page = 1,

        [Parameter(Mandatory=$false, Position=4, ParameterSetName="Standard")]
        [ValidateNotNullOrEmpty()]
        [Int]$PerPage = 30

    )

    try {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

        switch ($PSCmdlet.ParameterSetName){

            "Standard" {

                Write-Verbose -Message "Retrieving all assets for release $($ReleaseId)"
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/$($ReleaseId)/assets?page=$($page)&per_page=$($PerPage)"
                break
            }

            "ById" {

                foreach ($AssetId in $Id) {
                    Write-Verbose -Message "Retrieving asset $($AssetId) for release $($ReleaseId)"
                    $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/assets/$($AssetId)"
                }

                break
            }

        }

        Invoke-GitHubRestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

    }
    catch [Exception]{

        throw $_.Exception

    }

}