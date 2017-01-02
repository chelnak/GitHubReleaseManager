function Invoke-GitHubRestMethod {
<#
    .SYNOPSIS
    A module specific wrapper for Invoke-ResetMethod

    .DESCRIPTION
    A module specific wrapper for Invoke-ResetMethod

    .PARAMETER Method
    METHOD: GET, POST, PUT, DELETE

    .PARAMETER URI
    Service URI

    .PARAMETER Body
    Payload for the request, if applicable

    .PARAMETER InFile
    The File to upload

    .PARAMETER OutFile
    Path to downloaded file

    .PARAMETER ContentType
    The content type of the file to upload

    .PARAMETER Headers
    Optional Headers to send. This will override the default set provided

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Invoke-GitHubRestMethod -Method POST -URI /api/release/1

#>
[CmdletBinding(DefaultParameterSetName="Standard")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true, Position=0)]
        [ValidateSet("HEAD","GET","POST","PUT","DELETE")]
        [String]$Method,

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [String]$URI,

        [Parameter(Mandatory=$false, Position=2, ParameterSetName="WithBody")]
        [ValidateNotNullOrEmpty()]
        [String]$Body,

        [Parameter(Mandatory=$false, Position=3, ParameterSetName="InFile")]
        [ValidateNotNullOrEmpty()]
        [String]$InFile,

        [Parameter(Mandatory=$false, Position=4, ParameterSetName="InFile")]
        [ValidateNotNullOrEmpty()]
        [String]$ContentType,

        [Parameter(Mandatory=$false, Position=5, ParameterSetName="OutFile")]
        [ValidateNotNullOrEmpty()]
        [String]$OutFile,

        [Parameter(Mandatory=$false, Position=6)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.IDictionary]$Headers

    )

    # --- Build full URI
    $BaseURI = "https://api.github.com"
    $FullURI = "$($BaseUri)$($URI)"

    # --- Grab the sessionstate variable & test throw if it is null
    $SessionInfo = Get-GitHubSessionInformation -Verbose:$VerbosePreference

    # --- If the headers parameter is not passed use the deafult
    if (!$PSBoundParameters.ContainsKey("Headers")) {

        $Headers = @{

            "Accept" = "application/vnd.github.v3+json"
            "Authorization" = "Basic $($SessionInfo.Authorization)"
        }

    }

    try {

        $Params = @{

            Method = $Method
            Headers = $Headers
            Uri = $FullURI

        }

        if ($PSBoundParameters.ContainsKey("Body")) {

            $Params.Add("Body", $Body)

        }

        if ($PSBoundParameters.ContainsKey("OutFile")) {

            $Params.Add("OutFile", $OutFile)

        }

        if ($PSBoundParameters.ContainsKey("InFile")) {

            $UploadURI = "https://uploads.github.com"
            $Params.Uri = "$($UploadURI)$($URI)"
            $Params.Add("InFile", $InFile)
            $Params.Add("ContentType", $ContentType)

        }

        $Response = Invoke-RestMethod @Params -Verbose:$VerbosePreference

    }
    catch [System.Net.WebException]{

        $PSCallStack = Get-PSCallStack
        throw "$($PSCallStack[1].Command) $($_)"

    }
    catch [Exception] {

        throw $_.Exception.Message

    }
    finally {

        if ($PSVersionTable.PSEdition -eq "Desktop") {

            $ServicePoint = [System.Net.ServicePointManager]::FindServicePoint($FullURI)
            $ServicePoint.CloseConnectionGroup("") | Out-Null

        }

    }

    Write-Output $Response

}