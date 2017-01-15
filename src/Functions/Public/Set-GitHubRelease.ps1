function Set-GitHubRelease {
<#
    .SYNOPSIS
    Set information about a release

    .DESCRIPTION
    Set information about a release

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The id of the release

    .PARAMETER Tag
    The name of the TagName

    .PARAMETER Target
    Specifies the commitish value that determines where the Git tag is created from.
    Can be any branch or commit SHA. Unused if the Git tag already exists.
    Default: the repository's default branch (usually master).

    .PARAMETER Name
    The name of the release

    .PARAMETER Body
    Text describing the contents of the tag

    .PARAMETER Draft
    Makes the release a draft

    .PARAMETER Prerelease
    Makes the release a Prerelease

    .INPUTS
    System.String
    System.S

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

        [Parameter(Mandatory=$false, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$false, Position=1)]
        [ValidateNotNullOrEmpty()]
        [String]$Id,

        [Parameter(Mandatory=$false, Position=2)]
        [ValidateNotNullOrEmpty()]
        [String]$Tag,

        [Parameter(Mandatory=$false, Position=3)]
        [ValidateNotNullOrEmpty()]
        [String]$Target,

        [Parameter(Mandatory=$true, Position=4)]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory=$false, Position=5)]
        [ValidateNotNullOrEmpty()]
        [String]$Body,

        [Parameter(Mandatory=$false, Position=6)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.SwitchParameter]$Draft,

        [Parameter(Mandatory=$false, Position=3)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.SwitchParameter]$Prerelease

    )

    try {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

        $Release = [PSCustomObject] @{
            name = $Name
        }

        if ($PSBoundParameters.ContainsKey("Tag")){

            $Release | Add-Member -MemberType NoteProperty -Name tag_name -Value $Tag

        }

        if ($PSBoundParameters.ContainsKey("Target")){

            $Release | Add-Member -MemberType NoteProperty -Name target_commitish -Value $Target

        }

        if ($PSBoundParameters.ContainsKey("Body")){

            $Release | Add-Member -MemberType NoteProperty -Name body -Value $Body

        }

        if ($PSBoundParameters.ContainsKey("Draft")){

            $Release | Add-Member -MemberType NoteProperty -Name draft -Value $true

        }

        if ($PSBoundParameters.ContainsKey("Prerelease")){

            $Release | Add-Member -MemberType NoteProperty -Name prerelease -Value $true

        }

        if ($PSCmdlet.ShouldProcess($Id)){

            $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/$($Id)"
            Invoke-GitHubRestMethod -Method PATCH -URI $URI -Body ($Release | ConvertTo-Json) -Verbose:$VerbosePreference

        }

    }
    catch [Exception]{

        throw $_.Exception

    }

}