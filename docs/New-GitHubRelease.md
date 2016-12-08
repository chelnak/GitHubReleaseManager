# New-GitHubRelease

## SYNOPSIS
Create a new release for a repository

## SYNTAX

```
New-GitHubRelease [-Name] <String> [[-Description] <String>] [[-Target] <String>] [-Tag] <String>
 [-Assets] <Hashtable[]> [-Draft] [-Prerelease] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Create a new release for a repository

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0
```

### -------------------------- EXAMPLE 2 --------------------------
```
New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Draft
```

### -------------------------- EXAMPLE 3 --------------------------
```
New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Prerelease
```

### -------------------------- EXAMPLE 4 --------------------------
```
$Asset = @{
```

"Path" = ".\Release\TestRelease-0.1.0.zip"
    "Content-Type" = "application/zip"
}
New-GitHubRelease -Name TestRelease -Description "Test v1.0 release" -Target master -Tag v1.0 -Assets $Asset

## PARAMETERS

### -Name
The name of the release

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

### -Description
Text describing the contents of the tag.

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
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tag
The name of the tag

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assets
An array of Assets to upload with the release.

An asset should be in the form of a hashtable and must contain the following keys:

Path - The Path of the asset that will be uploaded
Content-Type - The Content-Type type of the asset that will be uploaded

For example, the hashtable would be formed like this:

@{

    "Path" = "C:\Assets\Asset-v1.0.zip"
    "Content-Type" = "application/zip"

}

For a list of supplorted content types see the following url -\> https://www.iana.org/assignments/media-types/media-types.xhtml

```yaml
Type: Hashtable[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Draft
Make the release a draft

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Prerelease
Make the release a prerelease

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
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
Switch

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

