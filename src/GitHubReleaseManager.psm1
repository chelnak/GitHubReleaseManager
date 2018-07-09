$Public = Get-ChildItem -Path "$($PSScriptRoot)\Functions\Public\*.ps1" -Verbose:$VerbosePreference

foreach($Function in $Public) {

    try {

        . $Function.FullName

    }
    catch {

        Write-Error "Failed to import function $($Function.FullName)"

    }

}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 # GitHub requires TLS version 1.2
Export-ModuleMember -Function $($Public | Select-Object -ExpandProperty BaseName) -Verbose:$VerbosePreference
