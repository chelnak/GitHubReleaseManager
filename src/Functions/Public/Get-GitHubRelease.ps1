function Get-GitHubRelease {
<#
    .SYNOPSIS
    Get a list of releases for a Repository

    .DESCRIPTION
    Get a list of releases for a Repository

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The id of the release

    .PARAMETER Tag
    The tag associated with the release

    .PARAMETER Latest
    Retrieve the latest release

    .PARAMETER Page
    The page number to return

    .PARAMETER PerPage
    The number of entries per page

    .INPUTS
    System.String
    System.Int
    Switch

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Get-GitHubRelease -Repository MyRepository

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

        [Parameter(Mandatory=$true, Position=1, ParameterSetName="ById")]
        [ValidateNotNullOrEmpty()]
        [String]$Id,

        [Parameter(Mandatory=$true, Position=2, ParameterSetName="ByTagName")]
        [ValidateNotNullOrEmpty()]
        [String]$Tag,

        [Parameter(Mandatory=$true, Position=3, ParameterSetName="Latest")]
        [ValidateNotNullOrEmpty()]
        [Switch]$Latest,

        [Parameter(Mandatory=$false, Position=4, ParameterSetName="Standard")]
        [ValidateNotNullOrEmpty()]
        [Int]$Page = 1,

        [Parameter(Mandatory=$false, Position=5, ParameterSetName="Standard")]
        [ValidateNotNullOrEmpty()]
        [Int]$PerPage = 30

    )

    try {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

        switch ($PSCmdlet.ParameterSetName){

            "Standard" {

                Write-Verbose -Message "Retrieving all releases for Repository $($Repository)"
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases?page=$($page)&per_page=$($PerPage)"
                break
            }

            "ById" {

                Write-Verbose -Message "Retrieving release $($Id) for $($Repository)"
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/$($Id)"
                break
            }

            "ByTagName" {

                Write-Verbose -Message "Retrieving release with tag $($Tag) for Repository $($Repository)"
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/tags/$($Tag)"
                break
            }

            "Latest" {

                Write-Verbose -Message "Retrieving latest release for Repository $($Repository)"
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/latest"
                break
            }

        }

        Invoke-GitHubRestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

    }
    catch [Exception]{

        throw $_.Exception

    }

}