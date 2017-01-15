# Set-GitHubRelease

## SYNOPSIS
Set information about a release

## SYNTAX

```
Set-GitHubRelease [[-Repository] <String>] [[-Id] <String>] [[-Tag] <String>] [[-Target] <String>]
 [-Name] <String> [[-Body] <String>] [-Draft] [-Prerelease] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Set information about a release

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

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
The id of the release

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tag
The name of the TagName

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Target
Specifies the commitish value that determines where the Git tag is created from.
Can be any branch or commit SHA.
Unused if the Git tag already exists.
Default: the repository's default branch (usually master).

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

### -Name
The name of the release

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
Text describing the contents of the tag

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Draft
Makes the release a draft

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: 7
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Prerelease
Makes the release a Prerelease

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: False
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
System.S

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

