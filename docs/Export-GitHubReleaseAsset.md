# Export-GitHubReleaseAsset

## SYNOPSIS
Get a list of assets for a release

## SYNTAX

```
Export-GitHubReleaseAsset [-Repository] <String> [-Id] <String[]> [[-Path] <String>]
```

## DESCRIPTION
Get a list of assets for a release

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Export-GitHubReleaseAsset -Repository MyRepository -Id xxxx
```

### -------------------------- EXAMPLE 2 --------------------------
```
Export-GitHubReleaseAsset -Repository MyRepository -Id xxxx -Path C:\Assets
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
The id of the asset to export

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
The resulting path.
If this parameter is not passed the action will be exported to
the current working directory.

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

## INPUTS

### System.String

## OUTPUTS

### System.IO.FileInfo

## NOTES

## RELATED LINKS

