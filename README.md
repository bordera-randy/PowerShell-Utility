# PowerShell Utility Scripts

A comprehensive collection of production-ready PowerShell scripts for system administration, cloud management, and automation tasks. All scripts include detailed documentation, error handling, and follow PowerShell best practices.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Script Categories](#script-categories)
  - [Azure Scripts](#azure-scripts)
  - [Office 365 Scripts](#office-365-scripts)
  - [System Administration Scripts](#system-administration-scripts)
  - [Fun Scripts](#fun-scripts)
- [Documentation](#documentation)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

## About

This repository provides a curated collection of PowerShell scripts designed to help system administrators, cloud engineers, and IT professionals automate common tasks, manage cloud resources, and improve productivity. Whether you're managing Azure infrastructure, Office 365 tenants, or local Windows systems, you'll find useful, well-documented utilities here.

### Key Principles

- **Production-Ready**: All scripts are designed for real-world use with proper error handling
- **Well-Documented**: Every script includes comprehensive comment-based help
- **Security-First**: No hardcoded credentials; secure credential management
- **Tested**: Scripts follow PowerShell best practices and coding standards

## Features

✅ **Comprehensive Documentation** - Every script includes detailed help with examples  
✅ **Security Best Practices** - No hardcoded secrets, secure credential handling  
✅ **Error Handling** - Robust error handling and user feedback  
✅ **Modular Design** - Reusable functions and clean code structure  
✅ **Active Maintenance** - Regular updates and improvements  

## Installation

### Prerequisites

- PowerShell 5.1 or PowerShell 7+ (recommended)
- Appropriate admin permissions for your target systems
- Required modules (see specific script categories below)

### Clone the Repository

```powershell
# Clone the repository
git clone https://github.com/bordera-randy/PowerShell-Utility.git

# Navigate to the project directory
cd PowerShell-Utility

# Set execution policy if needed (run as Administrator)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Quick Start

```powershell
# View help for any script
Get-Help .\scripts\Azure\Manage-AzureVMs.ps1 -Full

# Run a script with parameters
.\scripts\Azure\Manage-AzureVMs.ps1 -Action List

# List all available scripts
Get-ChildItem -Path .\scripts -Recurse -Filter "*.ps1"
```

## Script Categories

### Azure Scripts

Manage Azure resources including VMs, storage, resource groups, and backups.

**📁 Location**: `scripts/Azure/`

**Available Scripts**:
- `Manage-AzureVMs.ps1` - Start, stop, restart, and monitor Azure VMs
- `Manage-ResourceGroups.ps1` - Create and manage Azure resource groups
- `Manage-StorageAccounts.ps1` - Manage Azure storage accounts
- `Manage-VMBackup.ps1` - ⭐ NEW: Azure VM backup and recovery management

**Prerequisites**: 
```powershell
Install-Module -Name Az -Scope CurrentUser
Connect-AzAccount
```

[📖 View Azure Scripts Documentation](scripts/Azure/README.md)

### Office 365 Scripts

Comprehensive Office 365 and Microsoft 365 management tools.

**📁 Location**: `scripts/Office365/`

**Available Scripts**:
- `Manage-O365Users.ps1` - User account management via Microsoft Graph
- `Manage-Teams.ps1` - Microsoft Teams administration
- `Manage-ExchangeOnline.ps1` - Exchange Online mailbox management
- `Manage-Licenses.ps1` - ⭐ NEW: Comprehensive license management
- `O365-Discovery.ps1` - Generate comprehensive tenant reports
- `Mailboxpermissionsreport.ps1` - Audit mailbox permissions
- `Convert GUID to ImmutableID.ps1` - AD synchronization utilities

**Prerequisites**:
```powershell
Install-Module -Name Microsoft.Graph -Scope CurrentUser
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser
```

[📖 View Office 365 Scripts Documentation](scripts/Office365/README.md)

### System Administration Scripts

Tools for Windows system administration and monitoring.

**📁 Location**: `scripts/SystemAdmin/`

**Available Scripts**:
- `Monitor-DiskSpace.ps1` - Disk space monitoring with alerts
- `Manage-Services.ps1` - Windows service management
- `Analyze-EventLogs.ps1` - Event log analysis and reporting
- `Cleanup-DiskSpace.ps1` - ⭐ NEW: Comprehensive disk cleanup utility
- `Monitor-Performance.ps1` - ⭐ NEW: Real-time performance monitoring

**Prerequisites**: Windows OS with PowerShell 5.1+

[📖 View System Admin Scripts Documentation](scripts/SystemAdmin/README.md)

### Fun Scripts

Entertaining and visually appealing scripts to brighten your day!

**📁 Location**: `scripts/Fun/`

**Available Scripts**:
- `Get-ASCIIArt.ps1` - Generate ASCII art with multiple styles
- `Get-RandomQuote.ps1` - Display inspirational tech quotes
- `Get-SystemInfo.ps1` - Beautiful system information display

[📖 View Fun Scripts Documentation](scripts/Fun/README.md)

## Documentation

Every script includes comprehensive comment-based help:

```powershell
# View full help
Get-Help .\script-name.ps1 -Full

# View examples only
Get-Help .\script-name.ps1 -Examples

# View specific parameters
Get-Help .\script-name.ps1 -Parameter ParameterName
```

Each category folder contains a detailed README with:
- Prerequisites and setup instructions
- Usage examples for each script
- Common troubleshooting tips
- Best practices

## Security

🔒 **Security is a priority**:

- ✅ No hardcoded credentials or API keys
- ✅ Secure credential handling using `Get-Credential`
- ✅ All sensitive placeholders use descriptive defaults (e.g., `YOUR_API_KEY_HERE`)
- ✅ Scripts follow the principle of least privilege
- ✅ Input validation and parameter constraints

**Before using scripts that require credentials**:
1. Replace placeholder values with your actual credentials
2. Use secure credential management (Azure Key Vault, Windows Credential Manager)
3. Never commit credentials to version control

## Contributing

Contributions are welcome! Please follow these guidelines:

1. **Fork** the repository
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Follow PowerShell best practices**:
   - Use comment-based help
   - Include parameter validation
   - Add error handling
   - Write clear, readable code
4. **Test thoroughly** in your environment
5. **Commit your changes** (`git commit -m 'Add amazing feature'`)
6. **Push to the branch** (`git push origin feature/amazing-feature`)
7. **Open a Pull Request**

### Coding Standards

- Use approved PowerShell verbs (`Get-Verb`)
- Include comprehensive comment-based help
- Add inline comments for complex logic
- Use parameter validation attributes
- Follow consistent naming conventions
- Test on PowerShell 5.1 and PowerShell 7+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Quick Links

- 📚 [About the Author](about.md)
- 🐛 [Report an Issue](https://github.com/bordera-randy/PowerShell-Utility/issues)
- 💡 [Request a Feature](https://github.com/bordera-randy/PowerShell-Utility/issues/new)
- 🤝 [Contributing Guidelines](#contributing)

---

**Made with ❤️ by Randy Bordeaux**

*Automate the boring parts. Document the hard parts. Leave things better than you found them.*
