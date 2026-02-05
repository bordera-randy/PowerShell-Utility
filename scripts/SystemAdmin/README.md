# System Administration Scripts

This directory contains PowerShell scripts for Windows system administration tasks.

## Prerequisites

- PowerShell 5.1+ (included with Windows)
- Administrator privileges for most operations
- Windows operating system

## Available Scripts

### Monitor-DiskSpace.ps1

Monitor disk space on local or remote computers and get alerts for low disk space.

**Features:**
- Check disk space on multiple computers
- Set custom threshold for alerts
- Color-coded status indicators
- Export results to CSV
- Summary of disk health

**Usage:**
```powershell
# Monitor local computer with default threshold (15%)
.\Monitor-DiskSpace.ps1

# Monitor with custom threshold
.\Monitor-DiskSpace.ps1 -ThresholdPercent 20

# Monitor remote computer
.\Monitor-DiskSpace.ps1 -ComputerName "Server01" -ThresholdPercent 10

# Monitor multiple computers
.\Monitor-DiskSpace.ps1 -ComputerName "Server01","Server02","Server03"

# Enable email alerts (configure email settings in script first)
.\Monitor-DiskSpace.ps1 -EmailAlert
```

**Parameters:**
- `-ComputerName`: Array of computer names to check (default: local computer)
- `-ThresholdPercent`: Percentage of free space to trigger low alert (default: 15)
- `-EmailAlert`: Enable email alerts for low disk space

### Manage-Services.ps1

Comprehensive Windows service management script.

**Features:**
- List all services with summary
- Get detailed service information
- Start/stop/restart services
- Configure service startup type
- List stopped automatic services
- Show dependent and required services

**Usage:**
```powershell
# List all services
.\Manage-Services.ps1 -Action List

# Get detailed info about a service
.\Manage-Services.ps1 -Action Info -ServiceName "Spooler"

# Start a service
.\Manage-Services.ps1 -Action Start -ServiceName "Spooler"

# Stop a service
.\Manage-Services.ps1 -Action Stop -ServiceName "Spooler"

# Restart a service
.\Manage-Services.ps1 -Action Restart -ServiceName "Spooler"

# Set startup type
.\Manage-Services.ps1 -Action SetStartup -ServiceName "Spooler" -StartupType "Automatic"

# List stopped automatic services
.\Manage-Services.ps1 -Action ListStopped

# Manage services on remote computer
.\Manage-Services.ps1 -Action List -ComputerName "Server01"
```

**Parameters:**
- `-Action`: List, Info, Start, Stop, Restart, SetStartup, ListStopped
- `-ServiceName`: Name of the service
- `-ComputerName`: Remote computer name (default: local computer)
- `-StartupType`: Automatic, Manual, or Disabled (for SetStartup action)

### Analyze-EventLogs.ps1

Analyze Windows Event Logs for errors, warnings, and specific events.

**Features:**
- Search for errors and warnings
- Search by Event ID
- Filter by time range
- Generate event log summary
- Group events by source
- Detailed event information

**Usage:**
```powershell
# Get errors from last 24 hours
.\Analyze-EventLogs.ps1 -Action Errors -Hours 24

# Get warnings from last 48 hours
.\Analyze-EventLogs.ps1 -Action Warnings -Hours 48

# Search for specific Event ID
.\Analyze-EventLogs.ps1 -Action Search -LogName "System" -EventID 1074 -Hours 24

# Generate event log summary
.\Analyze-EventLogs.ps1 -Action Summary -Hours 24

# Get application errors only
.\Analyze-EventLogs.ps1 -Action ApplicationErrors -Hours 24

# Get system errors only
.\Analyze-EventLogs.ps1 -Action SystemErrors -Hours 24

# Get more events (default is 100)
.\Analyze-EventLogs.ps1 -Action Errors -Hours 24 -MaxEvents 500

# Analyze remote computer
.\Analyze-EventLogs.ps1 -Action Errors -ComputerName "Server01" -Hours 24
```

**Parameters:**
- `-Action`: Errors, Warnings, Search, Summary, ApplicationErrors, SystemErrors
- `-ComputerName`: Computer name to analyze (default: local)
- `-LogName`: Event log name (default: "Application")
- `-EventID`: Specific Event ID to search for
- `-Hours`: Time range to analyze (default: 24 hours)
- `-MaxEvents`: Maximum events to retrieve (default: 100)

## Common Administrative Tasks

### Daily Health Check

```powershell
# Quick system health check
.\Monitor-DiskSpace.ps1
.\Manage-Services.ps1 -Action ListStopped
.\Analyze-EventLogs.ps1 -Action Summary -Hours 24
```

### Service Troubleshooting

```powershell
# Check if a service is running
.\Manage-Services.ps1 -Action Info -ServiceName "ServiceName"

# Check event logs for service issues
.\Analyze-EventLogs.ps1 -Action Search -LogName "System" -EventID 7036 -Hours 24

# Restart problematic service
.\Manage-Services.ps1 -Action Restart -ServiceName "ServiceName"
```

### Disk Space Management

```powershell
# Check all servers for low disk space
$servers = "Server01","Server02","Server03"
foreach ($server in $servers) {
    .\Monitor-DiskSpace.ps1 -ComputerName $server -ThresholdPercent 20
}
```

### Event Log Analysis

```powershell
# Check for critical errors across logs
.\Analyze-EventLogs.ps1 -Action Errors -Hours 24

# Look for specific error patterns
.\Analyze-EventLogs.ps1 -Action Search -LogName "Application" -EventID 1000 -Hours 168
```

## Best Practices

1. **Run as Administrator**: Many operations require elevated privileges
2. **Test on non-critical systems first**: Always test scripts in a safe environment
3. **Regular monitoring**: Schedule these scripts to run regularly
4. **Document changes**: Keep track of service changes and their reasons
5. **Backup before changes**: Create system restore points before making significant changes
6. **Review logs regularly**: Don't wait for problems to appear
7. **Use remote management carefully**: Ensure you have proper permissions

## Scheduling Scripts

Use Windows Task Scheduler to run these scripts automatically:

```powershell
# Example: Schedule daily disk space check
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\Monitor-DiskSpace.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 8am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Daily Disk Space Check" -Description "Monitor disk space daily"
```

## Remote Management

To manage remote computers:

1. **Enable PowerShell Remoting:**
```powershell
# On remote computer
Enable-PSRemoting -Force

# Test connection
Test-WSMan -ComputerName "RemoteComputer"
```

2. **Configure Firewall:**
```powershell
# Allow PowerShell remoting through firewall
Enable-NetFirewallRule -Name "WINRM-HTTP-In-TCP"
```

3. **Use appropriate credentials:**
```powershell
# Run script with alternate credentials
$cred = Get-Credential
Invoke-Command -ComputerName "Server01" -Credential $cred -ScriptBlock { 
    # Your commands here
}
```

## Common Issues

**Issue**: "Access denied"
```
Solution: Run PowerShell as Administrator
```

**Issue**: "Remote computer not accessible"
```powershell
# Solution: Enable PowerShell Remoting
Enable-PSRemoting -Force

# Check firewall rules
Get-NetFirewallRule -Name "WINRM*"
```

**Issue**: "Service cannot be stopped because it has dependent services"
```
Solution: The script will show you dependent services and ask for confirmation
```

**Issue**: "Event log is full"
```powershell
# Clear event log (backup first!)
Get-EventLog -LogName Application | Export-Csv "AppLog_Backup.csv"
Clear-EventLog -LogName Application
```

## Security Considerations

1. **Use least privilege**: Don't run as admin unless necessary
2. **Audit changes**: Log all service and configuration changes
3. **Restrict remote access**: Only allow from trusted networks
4. **Use encrypted connections**: Enable HTTPS for PowerShell remoting
5. **Monitor script execution**: Track who runs these scripts and when

## Additional Resources

- [Windows Event Log Documentation](https://docs.microsoft.com/en-us/windows/win32/eventlog/event-logging)
- [Windows Services Guide](https://docs.microsoft.com/en-us/windows/win32/services/services)
- [PowerShell Remoting](https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/running-remote-commands)
- [Task Scheduler](https://docs.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page)
