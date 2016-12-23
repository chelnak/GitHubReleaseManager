[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath
        $? | Should Be $true
    }
}

Describe 'Test Module Functionality' -Fixture {

    It -Name "Retrieve Session Information" -Test {

       $SessionInfo = Get-GitHubSessionInformation
       $SessionInfo.Username | Should Be $Username

    }

    It -Name "Create A New Release" -Test {

        New-GitHubRelease -Repository $RepositoryName -Name $ReleaseName -Description "Test release" -Target master -Tag $ReleaseTag -Confirm:$false

        $Release = Get-GitHubRelease -Repository $RepositoryName -Tag $ReleaseTag
        $Release.name | Should be $ReleaseName

    }

    It -Name "Get All Releases" -Test {

        $Releases = Get-GitHubRelease -Repository $RepositoryName
        $Releases.Count | Should BeGreaterThan 0

    }

    It -Name "Get Latest release" -Test {

        $Release = Get-GitHubRelease -Repository $RepositoryName -Latest
        $Release.name | Should Not Be $null

    }

    It -Name "Get Release By Tag" -Test {

        $Release = Get-GitHubRelease -Repository $RepositoryName -Tag $ReleaseTag
        $Release.name | Should Be $ReleaseName

    }

    It -Name "Get Release By Id" -Test {

        $ReleaseId = (Get-GitHubRelease -Repository $RepositoryName -Tag $ReleaseTag).id
        $Release = Get-GitHubRelease -Repository $RepositoryName -Id $ReleaseId
        $Release.name | Should Be $ReleaseName

    }

    It -Name "Remove release" -Test {

        $ReleaseId = (Get-GitHubRelease -Repository $RepositoryName -Tag $ReleaseTag).id
        Remove-GitHubRelease -Repository $RepositoryName -Id $ReleaseId -Confirm:$false

        try {

            $Release = Get-GitHubRelease -Repository $RepositoryName -Tag $ReleaseTag

        } catch {

            $Release | Should Be $null

        }

    }

# --- Clean up
Remove-Variable -Name GitHubSessionInformation -Force -ErrorAction SilentlyContinue

}

