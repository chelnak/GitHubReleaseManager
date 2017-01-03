# Import-GitHubReleaseAsset

## SYNOPSIS
Upload a an asset to a release

## SYNTAX

```
Import-GitHubReleaseAsset [-Repository] <String> [-ReleaseId] <String> [-Name] <String> [[-Label] <String>]
 [-Asset] <Hashtable[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Upload a an asset to a release

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$Asset = @{
```

"Path" = ".\Release\TestRelease-0.1.0.zip"
    "Content-Type" = "application/zip"
}
Import-GitHubReleaseAsset -Repository MyRepository -ReleaseId xxxx -Name TestRelease -Asset $Asset

### -------------------------- EXAMPLE 2 --------------------------
```
$Asset = @{
```

"Path" = ".\Release\TestRelease-0.1.0.zip"
    "Content-Type" = "application/zip"
}
Import-GitHubReleaseAsset -Repository MyRepository -ReleaseId xxxx -Name TestRelease -Label "Test Label" -Asset $Asset

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
The id of the release

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

### -Asset
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
Hashtable

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

