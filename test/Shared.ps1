# Dot source this script in any Pester test script that requires the module to be imported.

$ModuleManifestName = 'GitHubReleaseManager.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\src\$ModuleManifestName"

if (!$SuppressImportModule) {
    # -Scope Global is needed when running tests from inside of psake, otherwise
    # the module's functions cannot be found in the GitHubReleaseManager\ namespace
    Import-Module $ModuleManifestPath -Scope Global -Force
}

$RepositoryName = "TestRepository"
$Username = "chenak"
$APIKey = Get-Content -Path ..\.gittoken -Raw

$ReleaseName = "TestRelease-$(Get-Random -Maximum 50)"
$ReleaseTag = "v0.0.1-$(Get-Random -Maximum 50)"

Set-GithubSessionInformation -Username $Username -APIKey $APIKey | Out-Null