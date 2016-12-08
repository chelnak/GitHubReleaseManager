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

    .PARAMETER ContentType
    The content type of the file to upload

    .PARAMETER Headers
    Optional Headers to send. This will override the default set provided

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Invoke-OTSRestMethod -Method POST -URI /v1/generate?passphrase=1234"

#>
[CmdletBinding(DefaultParameterSetName="Standard")][OutputType('System.Management.Automation.PSObject')]

    Param (

        [Parameter(Mandatory=$true)]
        [ValidateSet("HEAD","GET","POST","PUT","DELETE")]
        [String]$Method,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$URI,

        [Parameter(Mandatory=$false, ParameterSetName="WithBody")]
        [ValidateNotNullOrEmpty()]
        [String]$Body,

        [Parameter(Mandatory=$false, ParameterSetName="InFile")]
        [ValidateNotNullOrEmpty()]
        [String]$InFile,

        [Parameter(Mandatory=$false, ParameterSetName="InFile")]
        [ValidateNotNullOrEmpty()]
        [String]$ContentType,

        [Parameter(Mandatory=$false)]
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


        switch ($PSCmdlet.ParameterSetName) {

            'WithBody' {

                $Response = Invoke-RestMethod -Method $Method -Headers $Headers -Uri $FullURI -Body $Body -Verbose:$VerbosePrefernce
                break

            }

            'Infile' {

                $UploadURI = "https://uploads.github.com"
                $FullURI = "$($UploadURI)$($URI)"
                $Response = Invoke-WebRequest -Method $Method -Uri $FullURI -Headers $Headers -InFile $InFile -ContentType $ContentType -Verbose:$VerbosePreference
                break

            }

            default {

                $Response = Invoke-RestMethod -Method $Method -Headers $Headers -Uri $FullURI -Verbose:$VerbosePreference
                break

            }

        }

    }
    catch [System.Net.WebException]{

        <#
        $Result = $_.Exception.Response.GetResponseStream()
        $Reader = New-Object System.IO.StreamReader($result)
        $Reader.BaseStream.Position = 0
        $Reader.DiscardBufferedData()
        $ResponseBody = $Reader.ReadToEnd()
        #>

        # --- If a WebException is caught get the calling function and append to the exception
        $PSCallStack = Get-PSCallStack

        throw "$($PSCallStack[1].Command) $($_)"

    }
    catch [Exception] {


        throw $_.Exception.Message

    }
    finally {

        $ServicePoint = [System.Net.ServicePointManager]::FindServicePoint($FullURI)
        $ServicePoint.CloseConnectionGroup("") | Out-Null

    }

    Write-Output $Response

}