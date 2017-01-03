# Get-GitHubReleaseAsset

## SYNOPSIS
Get a list of assets for a release

## SYNTAX

### Standard (Default)
```
Get-GitHubReleaseAsset [-Repository] <String> [-ReleaseId] <String> [[-Page] <Int32>] [[-PerPage] <Int32>]
```

### ById
```
Get-GitHubReleaseAsset [-Repository] <String> [-Id] <String[]>
```

## DESCRIPTION
Get a list of assets for a release

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitHubReleaseAsset -Repository MyRepository -ReleaseId xxxx
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-GitHubRelease -Repository MyRepository -Id xxxxx
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-GitHubRelease -Repository MyRepository -Tag v.1.0
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-GitHubRelease -Repository MyRepository -Latest
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

### -ReleaseId
{{Fill ReleaseId Description}}

```yaml
Type: String
Parameter Sets: Standard
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
The id of the release

```yaml
Type: String[]
Parameter Sets: ById
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Page
The page number to return

```yaml
Type: Int32
Parameter Sets: Standard
Aliases: 

Required: False
Position: 4
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -PerPage
The number of entries per page

```yaml
Type: Int32
Parameter Sets: Standard
Aliases: 

Required: False
Position: 5
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
System.Int

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

