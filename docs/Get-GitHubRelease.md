# Get-GitHubRelease

## SYNOPSIS
Get a list of releases for a Repository

## SYNTAX

### Standard (Default)
```
Get-GitHubRelease [-Repository] <String> [[-Page] <Int32>] [[-PerPage] <Int32>]
```

### ById
```
Get-GitHubRelease [-Repository] <String> [-Id] <String>
```

### ByTagName
```
Get-GitHubRelease [-Repository] <String> [-Tag] <String>
```

### Latest
```
Get-GitHubRelease [-Repository] <String> [-Latest]
```

## DESCRIPTION
Get a list of releases for a Repository

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-GitHubRelease -Repository MyRepository
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

### -Id
The id of the release

```yaml
Type: String
Parameter Sets: ById
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tag
The tag associated with the release

```yaml
Type: String
Parameter Sets: ByTagName
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Latest
Retrieve the latest release

```yaml
Type: SwitchParameter
Parameter Sets: Latest
Aliases: 

Required: True
Position: 4
Default value: False
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
Position: 5
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
Position: 6
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
System.Int
Switch

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

