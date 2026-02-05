# PowerShell Utility Collection

A comprehensive collection of PowerShell scripts for system administrators and cloud engineers. This repository contains useful utilities for managing Azure, Office 365, system administration tasks, and includes some fun scripts to brighten your day!

## Table of Contents

- [About](#about)
- [Installation](#installation)
  - [Installing PowerShell](#installing-powershell)
  - [Installing Required Modules](#installing-required-modules)
- [PowerShell Profile Setup](#powershell-profile-setup)
- [Script Categories](#script-categories)
  - [Azure Scripts](#azure-scripts)
  - [Office 365 Scripts](#office-365-scripts)
  - [System Administration Scripts](#system-administration-scripts)
  - [Fun Scripts](#fun-scripts)
- [Usage Examples](#usage-examples)
- [Contributing](#contributing)
- [License](#license)

## About

This repository provides a curated collection of PowerShell scripts designed to help system administrators and cloud engineers automate common tasks, manage cloud resources, and improve productivity. Whether you're managing Azure infrastructure, Office 365 tenants, or local Windows systems, you'll find useful utilities here.

## Installation

### Installing PowerShell

PowerShell 7+ is recommended for the best experience. It's cross-platform and works on Windows, macOS, and Linux.

#### Windows

**Option 1: Using winget (Windows 10 1809+ / Windows 11)**
```powershell
winget install --id Microsoft.PowerShell --source winget
```

**Option 2: Using MSI installer**
1. Download the latest MSI installer from [PowerShell GitHub Releases](https://github.com/PowerShell/PowerShell/releases)
2. Run the installer and follow the prompts
3. Restart your terminal

**Option 3: Using Chocolatey**
```powershell
choco install powershell-core
```

#### macOS

**Using Homebrew:**
```bash
brew install --cask powershell
```

#### Linux

**Ubuntu/Debian:**
```bash
# Update the list of packages
sudo apt-get update

# Install pre-requisite packages
sudo apt-get install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository GPG keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Update the list of packages after adding packages.microsoft.com
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh
```

**RHEL/CentOS:**
```bash
# Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

# Install PowerShell
sudo yum install -y powershell

# Start PowerShell
pwsh
```

### Verifying PowerShell Installation

After installation, verify PowerShell is installed correctly:

```powershell
# Check PowerShell version
$PSVersionTable
```

You should see output similar to:
```
Name                           Value
----                           -----
PSVersion                      7.4.0
PSEdition                      Core
GitCommitId                    7.4.0
OS                             Microsoft Windows 10.0.22631
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

### Installing Required Modules

Different scripts require different PowerShell modules. Install the ones you need:

#### For Azure Scripts

```powershell
# Install the Azure PowerShell module
Install-Module -Name Az -Repository PSGallery -Scope CurrentUser -AllowClobber -Force

# Import the module
Import-Module Az

# Connect to Azure
Connect-AzAccount
```

#### For Office 365 Scripts

```powershell
# Install Microsoft Graph PowerShell SDK
Install-Module -Name Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force

# Install Exchange Online Management
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser -Repository PSGallery -Force

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"

# Connect to Exchange Online
Connect-ExchangeOnline
```

#### Updating Modules

Keep your modules up to date:

```powershell
# Update all modules
Update-Module

# Update a specific module
Update-Module -Name Az
```

## PowerShell Profile Setup

PowerShell profiles allow you to customize your PowerShell environment with functions, aliases, and settings that load automatically when you start PowerShell.

### Understanding PowerShell Profiles

PowerShell has several profile types:

- **AllUsersAllHosts**: Applies to all users and all hosts
- **AllUsersCurrentHost**: Applies to all users but only the current host
- **CurrentUserAllHosts**: Applies to current user and all hosts
- **CurrentUserCurrentHost**: Applies to current user and current host only (most common)

### Check if Profile Exists

```powershell
# Check if profile exists
Test-Path $PROFILE

# View profile path
$PROFILE

# View all profile paths
$PROFILE | Select-Object *
```

### Creating Your PowerShell Profile

If your profile doesn't exist, create it:

```powershell
# Create profile directory if it doesn't exist
if (!(Test-Path -Path (Split-Path -Parent $PROFILE))) {
    New-Item -ItemType Directory -Path (Split-Path -Parent $PROFILE) -Force
}

# Create the profile file
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Open the profile in your default editor
notepad $PROFILE

# Or use code (VS Code) if installed
code $PROFILE
```

### Sample Profile Configuration

Here's a sample profile with useful configurations:

```powershell
# PowerShell Profile Configuration
# Location: $PROFILE

# ============================================
# Welcome Message
# ============================================
Write-Host "PowerShell $($PSVersionTable.PSVersion.ToString()) loaded!" -ForegroundColor Green
Write-Host "Profile loaded from: $PROFILE" -ForegroundColor Cyan
Write-Host ""

# ============================================
# Aliases
# ============================================
# Navigation shortcuts
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name grep -Value Select-String
Set-Alias -Name which -Value Get-Command

# Git shortcuts (if git is installed)
if (Get-Command git -ErrorAction SilentlyContinue) {
    function gs { git status }
    function ga { git add $args }
    function gc { git commit -m $args }
    function gp { git push }
    function gl { git log --oneline --graph --decorate --all }
}

# ============================================
# Custom Functions
# ============================================

# Quick system information
function sysinfo {
    Get-ComputerInfo | Select-Object CsName, WindowsVersion, OsArchitecture, CsProcessors
}

# Quick disk space check
function diskspace {
    Get-PSDrive -PSProvider FileSystem | 
    Select-Object Name, 
                  @{Name="Used(GB)";Expression={[math]::Round($_.Used/1GB,2)}},
                  @{Name="Free(GB)";Expression={[math]::Round($_.Free/1GB,2)}},
                  @{Name="Total(GB)";Expression={[math]::Round(($_.Used+$_.Free)/1GB,2)}},
                  @{Name="Free(%)";Expression={[math]::Round($_.Free/($_.Used+$_.Free)*100,2)}}
}

# Reload profile
function Reload-Profile {
    & $PROFILE
    Write-Host "Profile reloaded!" -ForegroundColor Green
}

# Find files quickly
function Find-File {
    param([string]$Name)
    Get-ChildItem -Recurse -Filter "*$Name*" -ErrorAction SilentlyContinue
}

# ============================================
# Prompt Customization
# ============================================
function prompt {
    $currentPath = (Get-Location).Path
    $userName = $env:USERNAME
    $computerName = $env:COMPUTERNAME
    
    Write-Host "[$userName@$computerName]" -NoNewline -ForegroundColor Green
    Write-Host " $currentPath" -ForegroundColor Cyan
    Write-Host ">" -NoNewline -ForegroundColor Yellow
    return " "
}

# ============================================
# Module Auto-Loading
# ============================================
# Uncomment the modules you use regularly

# Import-Module Az
# Import-Module Microsoft.Graph
# Import-Module ExchangeOnlineManagement

# ============================================
# Environment Variables
# ============================================
# Add your custom paths here
# $env:PATH += ";C:\MyTools"

# ============================================
# PSReadLine Configuration (Enhanced Command Line Editing)
# ============================================
if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
    
    # Set prediction source to history
    Set-PSReadLineOption -PredictionSource History
    
    # Set color for predictions
    Set-PSReadLineOption -Colors @{
        Command = 'Cyan'
        Parameter = 'Gray'
        String = 'Green'
        InlinePrediction = 'DarkGray'
    }
    
    # Set key handlers
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}

# ============================================
# Custom Scripts Path
# ============================================
# Add the scripts directory to your PATH if you cloned this repo
# $scriptsPath = "C:\Path\To\PowerShell-Utility\scripts"
# if (Test-Path $scriptsPath) {
#     $env:PATH += ";$scriptsPath"
# }

Write-Host "Ready to go! 🚀" -ForegroundColor Magenta
Write-Host ""
```

### Applying Profile Changes

After editing your profile:

```powershell
# Reload the profile in current session
. $PROFILE

# Or restart PowerShell
```

### Setting Execution Policy

If you encounter execution policy errors:

```powershell
# Check current execution policy
Get-ExecutionPolicy

# Set execution policy for current user (recommended)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Or for unrestricted (less secure)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

## Script Categories

### Azure Scripts

Located in `scripts/Azure/`:

- **Manage-AzureVMs.ps1**: Manage Azure Virtual Machines (list, start, stop, restart, status)
- **Manage-ResourceGroups.ps1**: Manage Azure Resource Groups (list, create, delete, info)
- **Manage-StorageAccounts.ps1**: Manage Azure Storage Accounts (list, create, delete, info, get keys)

### Office 365 Scripts

Located in `scripts/Office365/`:

- **Manage-O365Users.ps1**: Manage Office 365 users (list, create, disable, enable, reset password)
- **Manage-Teams.ps1**: Manage Microsoft Teams (list, create, add/remove members)
- **Manage-ExchangeOnline.ps1**: Manage Exchange Online mailboxes (list, get stats, set auto-reply, forwarding rules)

### System Administration Scripts

Located in `scripts/SystemAdmin/`:

- **Monitor-DiskSpace.ps1**: Monitor disk space and get alerts for low space
- **Manage-Services.ps1**: Manage Windows services (list, start, stop, restart, configure)
- **Analyze-EventLogs.ps1**: Analyze Windows Event Logs for errors and warnings

### Fun Scripts

Located in `scripts/Fun/`:

- **Get-ASCIIArt.ps1**: Generate ASCII art with different styles
- **Get-SystemInfo.ps1**: Display system information in a colorful format
- **Get-RandomQuote.ps1**: Display random inspirational and tech quotes

## Usage Examples

### Azure Management

```powershell
# List all Azure VMs
.\scripts\Azure\Manage-AzureVMs.ps1 -Action List

# Start a specific VM
.\scripts\Azure\Manage-AzureVMs.ps1 -Action Start -ResourceGroupName "MyRG" -VMName "MyVM"

# Create a new resource group
.\scripts\Azure\Manage-ResourceGroups.ps1 -Action Create -ResourceGroupName "NewRG" -Location "eastus"

# List storage accounts
.\scripts\Azure\Manage-StorageAccounts.ps1 -Action List
```

### Office 365 Management

```powershell
# Connect to Microsoft Graph first
Connect-MgGraph -Scopes "User.ReadWrite.All"

# List all users
.\scripts\Office365\Manage-O365Users.ps1 -Action List

# Create a new user
.\scripts\Office365\Manage-O365Users.ps1 -Action Create -UserPrincipalName "john@contoso.com" -DisplayName "John Doe"

# List all Teams
.\scripts\Office365\Manage-Teams.ps1 -Action List

# Connect to Exchange Online
Connect-ExchangeOnline

# Get mailbox statistics
.\scripts\Office365\Manage-ExchangeOnline.ps1 -Action GetMailboxStats -Identity "user@contoso.com"
```

### System Administration

```powershell
# Monitor disk space
.\scripts\SystemAdmin\Monitor-DiskSpace.ps1 -ThresholdPercent 20

# List all services
.\scripts\SystemAdmin\Manage-Services.ps1 -Action List

# Restart a service
.\scripts\SystemAdmin\Manage-Services.ps1 -Action Restart -ServiceName "Spooler"

# Analyze event logs for errors in the last 24 hours
.\scripts\SystemAdmin\Analyze-EventLogs.ps1 -Action Errors -Hours 24
```

### Fun Scripts

```powershell
# Generate ASCII art
.\scripts\Fun\Get-ASCIIArt.ps1 -Text "Hello" -Style Block

# Display system information
.\scripts\Fun\Get-SystemInfo.ps1 -Detailed

# Get a random quote
.\scripts\Fun\Get-RandomQuote.ps1 -Category Tech
```

## Best Practices

1. **Always test scripts in a non-production environment first**
2. **Review script parameters and help documentation** using `Get-Help .\ScriptName.ps1 -Full`
3. **Use appropriate credentials** and ensure you have necessary permissions
4. **Keep modules updated** with `Update-Module`
5. **Review execution policy** settings for security
6. **Use version control** for any modifications to scripts
7. **Document your changes** when customizing scripts

## Troubleshooting

### Common Issues

**Script execution is disabled:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Module not found:**
```powershell
Install-Module -Name ModuleName -Scope CurrentUser
```

**Permission denied:**
- Ensure you're running PowerShell as Administrator when required
- Check that you have appropriate permissions in Azure/Office 365

**Connection issues:**
```powershell
# For Azure
Disconnect-AzAccount
Connect-AzAccount

# For Microsoft Graph
Disconnect-MgGraph
Connect-MgGraph -Scopes "Required.Scope"

# For Exchange Online
Disconnect-ExchangeOnline
Connect-ExchangeOnline
```

## Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Add your scripts with proper documentation
4. Include examples in comments
5. Test your scripts thoroughly
6. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
7. Push to the branch (`git push origin feature/AmazingFeature`)
8. Open a Pull Request

### Script Guidelines

- Include comprehensive comment-based help at the top of each script
- Use proper parameter validation
- Include error handling
- Follow PowerShell best practices and style guide
- Test on multiple PowerShell versions if possible

## Resources

- [PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)
- [Azure PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/azure/)
- [Microsoft Graph PowerShell SDK](https://docs.microsoft.com/en-us/powershell/microsoftgraph/)
- [PowerShell Gallery](https://www.powershellgallery.com/)
- [PowerShell Community](https://reddit.com/r/PowerShell)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions:
- Open an issue on GitHub
- Check existing issues for solutions
- Review the script documentation with `Get-Help`

---

**Happy Scripting! 🚀**