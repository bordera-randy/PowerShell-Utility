# PowerShell Utility Scripts

A collection of PowerShell utility scripts for common administrative and automation tasks.

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

Instructions on how to use these scripts.

```powershell
# Clone the repository
git clone https://github.com/yourusername/PowerShell-Utility.git

# Navigate to the project directory
cd PowerShell-Utility

# Set execution policy if needed (run as Administrator)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### macOS

Examples of how to use the scripts.

```powershell
# Run a script
.\ScriptName.ps1

# Get help for a script
Get-Help .\ScriptName.ps1 -Full
```

## Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Test your scripts thoroughly.
5. Commit your changes (`git commit -m 'Add some feature'`).
6. Push to the branch (`git push origin feature-branch`).
7. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
