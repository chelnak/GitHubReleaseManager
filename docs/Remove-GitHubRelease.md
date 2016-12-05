# Remove-GitHubRelease

## SYNOPSIS
Remove a release

## SYNTAX

```
Remove-GitHubRelease [-Id] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Remove a release

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-GitHubRelease -Id 12345
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-GitHubRelease -Id 12345 | Remove-GitHubRelease
```

## PARAMETERS

### -Id
The Id of the release to remove

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

