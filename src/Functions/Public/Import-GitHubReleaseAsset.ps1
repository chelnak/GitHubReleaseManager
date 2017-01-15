function Import-GitHubReleaseAsset {
<#
    .SYNOPSIS
    Upload a an asset to a release

    .DESCRIPTION
    Upload a an asset to a release

    .PARAMETER Repository
    The name of the repository

    .PARAMETER ReleaseId
    The id of the release

    .PARAMETER Name
    The name of the asset

    .PARAMETER Label
    An alternate short description of the asset. Used in place of the filename.

    .PARAMETER Asset
    An array of Assets to upload with the release.

    An asset should be in the form of a hashtable and must contain the following keys:

    Path - The Path of the asset that will be uploaded
    Content-Type - The Content-Type type of the asset that will be uploaded

    For example, the hashtable would be formed like this:

    @{

        "Path" = "C:\Assets\Asset-v1.0.zip"
        "Content-Type" = "application/zip"

    }

    For a list of supplorted content types see the following url -> https://www.iana.org/assignments/media-types/media-types.xhtml

    .INPUTS
    System.String
    Hashtable

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    $Asset = @{
        "Path" = ".\Release\TestRelease-0.1.0.zip"
        "Content-Type" = "application/zip"
    }
    Import-GitHubReleaseAsset -Repository MyRepository -ReleaseId xxxx -Name TestRelease -Asset $Asset

    .EXAMPLE
    $Asset = @{
        "Path" = ".\Release\TestRelease-0.1.0.zip"
        "Content-Type" = "application/zip"
    }
    Import-GitHubReleaseAsset -Repository MyRepository -ReleaseId xxxx -Name TestRelease -Label "Test Label" -Asset $Asset

#>
[CmdletBinding(SupportsShouldProcess, ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [String]$ReleaseId,

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory=$false, Position=3)]
        [ValidateNotNullOrEmpty()]
        [String]$Label,

        [Parameter(Mandatory=$true, Position=4)]
        [ValidateNotNullOrEmpty()]
        [Hashtable[]]$Asset

    )

    try {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

        if ($PSCmdlet.ShouldProcess($ReleaseId)) {

            foreach ($Item in $Asset) {

                if (!($Item.ContainsKey("Path") -and $Item.ContainsKey("Content-Type"))) {

                    throw "The Assets parameter is not correct. See function help for more information."

                }

                # --- Retrieve parameters from hashtable
                $Path = $Item.Get_Item("Path")
                $ContentType = $Item.Get_Item("Content-Type")

                # --- Execute Request
                $ResolvedAsset = Get-Item -LiteralPath $Path
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/$($ReleaseId)/assets?name=$($ResolvedAsset.Name)"
                Write-Verbose -Message "Uploading asset $($ResolvedAsset.FullName)"
                Invoke-GitHubRestMethod -Method POST -URI $URI -InFile $ResolvedAsset.FullName -ContentType $ContentType -Verbose:$VerbosePreference | Out-Null

            }

        }

    }
    catch [Exception]{

        throw $_.Exception

    }

}