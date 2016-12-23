# GitHubReleaseMangaer

A PowerShell module for automating GitHub releases

## Usage

Before you start you'll need to create a Personal Access Token with the following scopes:

* repo
  * repo:status
  * repo_deployment
  * public_repo

Once you have your token open PowerShell follow these steps:

* Set session information

```
Set-GitHubSessionInformation -Username user -APIKey xxxxxxxxxxxxxxxxxxx
```

* Create a release with associated assets

```
$Asset @ {
    "Path" = ".\Release\MyRepositoryAsset.zip
    "Content-Type" = "application/zip"
}

New-GitHubRelease -Repository TestRepository -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Assets $Asset

```

The module can also be used with PSake. Here is an example build task:

```
Task CreateGitHubRelease {

    Set-GitHubSessionInformation -UserName $GitHubUsername -APIKey $GithubAPIKey -Verbose:$VerbosePreference | Out-Null

    $CurrentModuleVersion = (Import-PowerShellDataFile -Path $ModuleManifestPath).ModuleVersion

    Write-Verbose -Message "Current module version is $($CurrentModuleVersion)"

    $AssetPath = "$($OutDir)\$($ModuleName)-$($CurrentModuleVersion).zip"

    Write-Verbose -Message "Asset path is $($AssetPath)"

    $Asset = @{
        "Path" = $AssetPath
        "Content-Type" = "application/zip"
    }

    New-GitHubRelease -Repository $GithubRepositoryName -Name $ModuleName -Target $GitHubReleaseTarget -Tag "v$($CurrentModuleVersion)" -Assets $Asset -Verbose:$VerbosePreference -Confirm:$false | Out-Null

}
```

## Help

Each function provided with this module has inbuilt help.

```
Get-Help New-GitHubRelease -Full
```

Alternatively you can view documentation on ReadTheDocs [here](http://githubreleasemanager.readthedocs.io/en/latest/).

## Contribute

Contributions are welcome! Please feel free to create pull requests and log issues.