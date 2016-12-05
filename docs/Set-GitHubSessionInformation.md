# Set-GitHubSessionInformation

## SYNOPSIS
Create information for this session

## SYNTAX

```
Set-GitHubSessionInformation [-Repository] <String> [-Username] <String> [-APIKey] <String> [-WhatIf]
 [-Confirm]
```

## DESCRIPTION
Create information for this session

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Set-GitHubSessionInformation -Repository TestRepo -Username user -APIKey xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## PARAMETERS

### -Repository
The repository to manage

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

### -Username
The username that has priveleges to manage the repository

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

### -APIKey
The personal access token associated with the username

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

