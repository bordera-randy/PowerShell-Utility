# Azure Management Scripts

This directory contains PowerShell scripts for managing Microsoft Azure resources.

## Prerequisites

- PowerShell 7+ (recommended)
- Az PowerShell module: `Install-Module -Name Az -Scope CurrentUser`
- Azure account with appropriate permissions
- Authenticated Azure session: `Connect-AzAccount`

## Available Scripts

### Manage-AzureVMs.ps1

Manage Azure Virtual Machines with ease.

**Features:**
- List all VMs in your subscription
- Start VMs
- Stop VMs  
- Restart VMs
- Get detailed VM status

**Usage:**
```powershell
# List all VMs
.\Manage-AzureVMs.ps1 -Action List

# Start a VM
.\Manage-AzureVMs.ps1 -Action Start -ResourceGroupName "MyRG" -VMName "MyVM"

# Stop a VM
.\Manage-AzureVMs.ps1 -Action Stop -ResourceGroupName "MyRG" -VMName "MyVM"

# Restart a VM
.\Manage-AzureVMs.ps1 -Action Restart -ResourceGroupName "MyRG" -VMName "MyVM"

# Get VM status
.\Manage-AzureVMs.ps1 -Action Status -ResourceGroupName "MyRG" -VMName "MyVM"
```

### Manage-ResourceGroups.ps1

Manage Azure Resource Groups.

**Features:**
- List all resource groups
- Create new resource groups
- Delete resource groups
- Get detailed resource group information

**Usage:**
```powershell
# List all resource groups
.\Manage-ResourceGroups.ps1 -Action List

# Create a resource group
.\Manage-ResourceGroups.ps1 -Action Create -ResourceGroupName "NewRG" -Location "eastus"

# Get resource group info
.\Manage-ResourceGroups.ps1 -Action Info -ResourceGroupName "MyRG"

# Delete a resource group (requires confirmation)
.\Manage-ResourceGroups.ps1 -Action Delete -ResourceGroupName "OldRG"
```

### Manage-StorageAccounts.ps1

Manage Azure Storage Accounts.

**Features:**
- List all storage accounts
- Create new storage accounts
- Delete storage accounts
- Get storage account information
- Retrieve storage account keys

**Usage:**
```powershell
# List all storage accounts
.\Manage-StorageAccounts.ps1 -Action List

# Create a storage account
.\Manage-StorageAccounts.ps1 -Action Create -StorageAccountName "mystorageacct" -ResourceGroupName "MyRG" -Location "eastus"

# Get storage account info
.\Manage-StorageAccounts.ps1 -Action Info -StorageAccountName "mystorageacct" -ResourceGroupName "MyRG"

# Get storage account keys
.\Manage-StorageAccounts.ps1 -Action GetKeys -StorageAccountName "mystorageacct" -ResourceGroupName "MyRG"

# Delete a storage account
.\Manage-StorageAccounts.ps1 -Action Delete -StorageAccountName "oldstorageacct" -ResourceGroupName "MyRG"
```

## Authentication

Before using these scripts, authenticate to Azure:

```powershell
# Interactive login
Connect-AzAccount

# Login with specific tenant
Connect-AzAccount -Tenant "your-tenant-id"

# Login with service principal
$credential = Get-Credential
Connect-AzAccount -ServicePrincipal -Credential $credential -Tenant "your-tenant-id"

# Verify connection
Get-AzContext
```

## Common Parameters

Most scripts support these common patterns:
- Use `-ResourceGroupName` to specify the resource group
- Use `-Location` to specify the Azure region (e.g., "eastus", "westus2", "northeurope")
- All actions are case-insensitive

## Best Practices

1. **Always test in non-production first**: Use a test subscription or resource group
2. **Review before deletion**: Scripts will prompt for confirmation before destructive actions
3. **Use appropriate permissions**: Ensure your account has the necessary RBAC roles
4. **Monitor costs**: Be aware of the costs associated with resources you create
5. **Tag your resources**: Consider adding tags for better organization

## Common Issues

**Issue**: "Az module not found"
```powershell
# Solution: Install the Az module
Install-Module -Name Az -Repository PSGallery -Scope CurrentUser -AllowClobber -Force
```

**Issue**: "Not authenticated to Azure"
```powershell
# Solution: Connect to Azure
Connect-AzAccount
```

**Issue**: "Insufficient permissions"
```
Solution: Ensure your account has the necessary role assignments (e.g., Contributor, Owner)
```

## Additional Resources

- [Azure PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/azure/)
- [Azure RBAC Documentation](https://docs.microsoft.com/en-us/azure/role-based-access-control/)
- [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)
