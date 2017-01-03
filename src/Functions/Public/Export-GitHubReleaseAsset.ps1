function Export-GitHubReleaseAsset {
<#
    .SYNOPSIS
    Get a list of assets for a release

    .DESCRIPTION
    Get a list of assets for a release

    .PARAMETER Repository
    The name of the repository

    .PARAMETER Id
    The id of the asset to export

    .PARAMETER Path
    The resulting path. If this parameter is not passed the action will be exported to
    the current working directory.

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .EXAMPLE
    Export-GitHubReleaseAsset -Repository MyRepository -Id xxxx

    .EXAMPLE
    Export-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Path C:\Assets

#>
[CmdletBinding()][OutputType('System.IO.FileInfo')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Repository,

        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [String[]]$Id,

        [Parameter(Mandatory=$false, Position=2)]
        [ValidateNotNullOrEmpty()]
        [String]$Path

    )

    Begin {

        # --- Grab the sessionstate variable & test throw if it is null
        $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

    }

    Process {

        try {

            $Headers = @{

                "Accept" = "application/octet-stream"
                "Authorization" = "Basic $($SessionInfo.Authorization)"
            }

            if (!$PSBoundParameters.ContainsKey("Path")) {

                Write-Verbose -Message "Path parameter not passed, exporting to current directory."
                $Path = "$($(Get-Location).Path)"

            }

            if ($Path.EndsWith("\")) {
                $Path = $Path.TrimEnd("\")
            }

            foreach ($AssetId in $Id) {

                $FileName = (Get-GithubReleaseAsset -Repository $Repository -Id $AssetId).name
                $FullPath = "$($Path)\$($FileName)"
                $URI = "/repos/$($SessionInfo.Username)/$($Repository)/releases/assets/$($Id)"

                Write-Verbose -Message "Exporting asset with Id $($AssetId) from repository $($Repository)"
                Invoke-GitHubRestMethod -Method GET -URI $URI -Headers $Headers -OutFile $FullPath -Verbose:$VerbosePreference

                Get-ChildItem -Path $FullPath -Verbose:$VerbosePreference

            }

        }
        catch [Exception]{

            throw $_.Exception

        }

    }

    End {}

}