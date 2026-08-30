#Requires -RunAsAdministrator
$ErrorActionPreference = 'Stop'

$reportPath = Join-Path $PSScriptRoot 'preinstall-report.json'

try {
    $secureBoot = Confirm-SecureBootUEFI
}
catch {
    $secureBoot = $null
}

try {
    $supportedResize = Get-PartitionSupportedSize -DriveLetter C |
        Select-Object SizeMin, SizeMax
}
catch {
    $supportedResize = $null
}

$report = [ordered]@{
    CollectedAt = (Get-Date).ToString('o')
    SecureBoot = $secureBoot
    Computer = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion,
        CsManufacturer, CsModel, CsTotalPhysicalMemory, BiosFirmwareType
    Disks = Get-Disk | Select-Object Number, FriendlyName, SerialNumber,
        PartitionStyle, OperationalStatus, HealthStatus, Size
    Partitions = Get-Partition | Select-Object DiskNumber, PartitionNumber,
        DriveLetter, Type, GptType, Size, Offset
    Volumes = Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem,
        DriveType, HealthStatus, Size, SizeRemaining
    SupportedResizeC = $supportedResize
    BitLocker = Get-BitLockerVolume | Select-Object MountPoint, VolumeStatus,
        ProtectionStatus, EncryptionMethod, LockStatus
}

$report | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $reportPath -Encoding utf8
Write-Host "Relatório criado em: $reportPath"
Write-Host 'Nenhuma configuração foi alterada.'
