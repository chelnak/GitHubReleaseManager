function New-GitHubRelease {
<#
    .SYNOPSIS
    Create a new release for a repository

    .DESCRIPTION
    Create a new release for a repository

    .PARAMETER Name
    The name of the release

    .PARAMETER Description
    Text describing the contents of the tag.

    .PARAMETER Target
    Specifies the commitish value that determines where the Git tag is created from.
    Can be any branch or commit SHA. Unused if the Git tag already exists.
    Default: the repository's default branch (usually master).

    .PARAMETER Tag
    The name of the tag

    .PARAMETER Assets
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

    .PARAMETER Draft
    Make the release a draft

    .PARAMETER Prerelease
    Make the release a prerelease

    .INPUTS
    System.String
    Switch

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0

    .EXAMPLE
    New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Draft

    .EXAMPLE
    New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Prerelease

    .EXAMPLE
    $Asset = @{
        "Path" = ".\Release\TestRelease-0.1.0.zip"
        "ContentType" = "application/zip"
    }
    New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Assets $Asset


#>
[CmdletBinding(SupportsShouldProcess, ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$Description,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [String]$Target,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Tag,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [Hashtable[]]$Assets,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Switch]$Draft,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Switch]$Prerelease

    )

    try {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

        $Body = [PSCustomObject] @{

            tag_name = $Tag
            target_commitish = $Target
            name = $Name
            body = $Description
            draft = $Draft.IsPresent
            prerelease = $Prerelease.IsPresent

        }

        $URI = "/repos/$($SessionInfo.Username)/$($SessionInfo.Repository)/releases"

        if ($PSCmdlet.ShouldProcess($SessionInfo.Repository)) {

            # --- Create the release
            $Response = Invoke-GitHubRestMethod -Method POST -URI $URI -Body ($Body | ConvertTo-JSON) -Verbose:$VerbosePreference

            # --- If the Assets parameter is passed upload each file
            if ($PSBoundParameters.ContainsKey("Assets")) {

                foreach ($Asset in $Assets) {

                    if (!($Asset.ContainsKey("Path") -and $Asset.ContainsKey("Content-Type"))) {

                        throw "The Assets parameter is not correct. See function help for more information."

                    }

                    # --- Retrieve parameters from hashtable
                    $Path = $Asset.Get_Item("Path")
                    $ContentType = $Asset.Get_Item("Content-Type")

                    # --- Execute Request
                    $ResolvedAsset = Get-Item -LiteralPath $Path
                    $UploadURI = "/repos/$($SessionInfo.Username)/$($SessionInfo.Repository)/releases/$($Response.id)/assets?name=$($ResolvedAsset.Name)"
                    Write-Verbose -Message "Uploading asset $($ResolvedAsset.FullName)"
                    Invoke-GitHubRestMethod -Method POST -URI $UploadURI -InFile $ResolvedAsset.FullName -ContentType $ContentType -Verbose:$VerbosePreference | Out-Null

                }

            }

        }

    }
    catch [Exception]{

        throw $_.Exception

    }

}