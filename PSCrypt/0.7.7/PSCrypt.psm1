# PowerShell Cryptography - Encrypt/Decrypt Files and Folders w/ EFS Encryption

function Enable-Encryption {
    <#
        .SYNOPSIS
            Enables EFS Encryption for specified File(s)/Folder(s).

        .DESCRIPTION
            Enables Windows EFS Encryption for specified File(s) or Folder(s).

        .PARAMETER Path
            [MANDATORY]:
            Specifies the Path to the file to be Encrypted.

        .EXAMPLE 
            PS C:\> Set-Encryption -Path 'C:\Test\SuperSecretFile.txt'
            (Encrypts the file 'SuperSecretFile.txt' using EFS)

        .EXAMPLE
            PS C:\> $path = Get-ChildItem -Path 'C:\Test' | Set-Encryption $path
            (Encrypts every sub-folder of the 'C:\Test' Directory)

        .LINK
            https://github.com/SupernautFX/

        .NOTES
            Filename:
            Version:
            Author:
            CreatedOn:
    #>

    [OutputType([Void])]
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [System.IO.FileInfo]$Path
    )

    BEGIN {
        $ErrorActionPreference = 'Stop'
    }

    PROCESS {
        TRY {
            $Path.Encrypt()
        }

        CATCH {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}

function Disable-Encryption {
    <#
        .SYNOPSIS
            Decrypts any EFS Encrypted File(s)/Folder(s).

        .DESCRIPTION
            Disables EFS Encryption on any File(s)/Folder(s) which previously had EFS Encryption Enabled.

        .PARAMETER Path
            [MANDATORY]:
            Specifies the Path to a File/Folder to Decrypt.

        .EXAMPLE
            PS C:\> Disable-Encryption -Path 'C:\Test\SuperSecretFile.txt'
            (Decrypts the file 'SuperSecretFile.txt' by disabling EFS)

        .EXAMPLE
            PS C:\> $path = Get-ChildItem -Path 'C:\Test' | Disable-Encryption $path
            (Decrypts all sub-folders of the 'C:\Test' Directory by disabling EFS)

        .LINK
            .

        .NOTES
            Filename:
            Version:
            Author:
            CreatedOn:
    #>

    [OutputType([Void])]
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [System.IO.FileInfo]$Path
    )

    BEGIN {
        $ErrorActionPreference = 'Stop'
    }

    PROCESS {
        TRY {
            $Path.Decrypt()
        }

        CATCH {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}