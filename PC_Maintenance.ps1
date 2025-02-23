# Define log file
$logFile = "$env:USERPROFILE\Desktop\PC_Maintenance_Log.txt"
Start-Transcript -Path $logFile -Append

# Function to clean temp files
Function Clean-TempFiles {
    Write-Output "Cleaning Temp Files..."
    Remove-Item -Path "C:\Windows\Temp\*" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:TEMP\*" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -Recurse -ErrorAction SilentlyContinue
}

# Empty Recycle Bin
Function Empty-RecycleBin {
    Write-Output "Emptying Recycle Bin..."
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
}

# Clear DNS Cache
Function Clear-DNSCache {
    Write-Output "Flushing DNS Cache..."
    ipconfig /flushdns
}

# Check for Windows Updates
Function Check-WindowsUpdates {
    Write-Output "Checking for Windows Updates..."
    Get-WindowsUpdateLog
}

# Defrag (only if HDD)
Function Defrag-Drives {
    Write-Output "Defragmenting Drives (HDD only)..."
    defrag C: /O
}

# Run all functions
Clean-TempFiles
Empty-RecycleBin
Clear-DNSCache
Check-WindowsUpdates
Defrag-Drives

# Stop transcript and save log
Stop-Transcript
Write-Output "PC Maintenance Completed."
