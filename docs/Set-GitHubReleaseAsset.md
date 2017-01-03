# Set-GitHubReleaseAsset

## SYNOPSIS
Set information about an asset

## SYNTAX

```
Set-GitHubReleaseAsset [-Repository] <String> [-Id] <String> [-Name] <String> [[-Label] <String>] [-WhatIf]
 [-Confirm]
```

## DESCRIPTION
Set information about an asset

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Set-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Name NewName
```

### -------------------------- EXAMPLE 2 --------------------------
```
Set-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Label NewLabel
```

### -------------------------- EXAMPLE 3 --------------------------
```
Set-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Name NewName -Label NewLabel
```

## PARAMETERS

### -Repository
The name of the repository

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
The id of the asset

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the asset

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
An alternate short description of the asset.
Used in place of the filename.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
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

