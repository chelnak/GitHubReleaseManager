# GitHubReleaseMangaer

A PowerShell module for automating GitHub releases

## Usage

Set session information
```
Set-GitHubSessionInformation -Repository MyRepository -Username user -APIKey xxxxxxxxxxxxxxxxxxx
```

Create a release with associated assets
```
$Asset @ {
    "Path" = ".\Release\MyRepositoryAsset.zip
    "Content-Type" = "application/zip"
}

New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Assets $Asset

```