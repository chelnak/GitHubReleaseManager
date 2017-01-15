function Remove-GitHubSessionInformation {
<#
    .SYNOPSIS
    Remove session variables from the current session

    .DESCRIPTION
    Remove session variables from the current session

    .INPUTS
    None

    .OUTPUTS
    None

    .EXAMPLE
    Remove-GitHubSessionInformation

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType()]

    Param ()

    try {

        if ($PSCmdlet.ShouldProcess("SessionInformation")){

            Remove-Variable -Name GithubSessionInformation -Scope Script -Verbose:$VerbosePreference

        }

    }
    catch [Exception]{

        throw $_.Exception

    }

}