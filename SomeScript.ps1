
    param (
        [Parameter(Mandatory = $true)]
        [string]$Directory
    )

    # Initialize an array to store file information
    $fileArray = @()

    # Get all files from the directory and subdirectories
    Get-ChildItem -Path $Directory -Recurse -File | ForEach-Object {
        # Create a custom object with file path and size
        $fileInfo = [PSCustomObject]@{
            FilePath = $_.FullName
            FileSize = $_.Length
        }
        # Add the object to the array
        $fileArray += $fileInfo
    }

    # Return the array
    return $fileArray
