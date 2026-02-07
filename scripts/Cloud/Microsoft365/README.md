# Office 365 Management Scripts

This directory contains PowerShell scripts for managing Microsoft 365/Office 365 services.

## Prerequisites

- PowerShell 7+ (recommended)
- Microsoft.Graph module: `Install-Module -Name Microsoft.Graph -Scope CurrentUser`
- ExchangeOnlineManagement module: `Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser`
- Microsoft 365 account with appropriate admin permissions

## Available Scripts

### Manage-O365Users.ps1

Manage Office 365 users using Microsoft Graph API.

**Prerequisites:**
- Microsoft.Graph.Users module
- Connected to Microsoft Graph: `Connect-MgGraph -Scopes "User.ReadWrite.All"`

**Features:**
- List all users
- Get detailed user information
- Create new users
- Enable/disable user accounts
- Reset user passwords

**Usage:**
```powershell
# Connect first
Connect-MgGraph -Scopes "User.ReadWrite.All"

# List all users
.\Manage-O365Users.ps1 -Action List

# Get user info
.\Manage-O365Users.ps1 -Action Info -UserPrincipalName "user@contoso.com"

# Create a new user
.\Manage-O365Users.ps1 -Action Create -UserPrincipalName "john@contoso.com" -DisplayName "John Doe"

# Disable a user
.\Manage-O365Users.ps1 -Action Disable -UserPrincipalName "user@contoso.com"

# Enable a user
.\Manage-O365Users.ps1 -Action Enable -UserPrincipalName "user@contoso.com"

# Reset password
.\Manage-O365Users.ps1 -Action ResetPassword -UserPrincipalName "user@contoso.com"
```

### Manage-Teams.ps1

Manage Microsoft Teams and team membership.

**Prerequisites:**
- Microsoft.Graph.Teams module
- Connected to Microsoft Graph: `Connect-MgGraph -Scopes "Team.ReadBasic.All","TeamMember.ReadWrite.All"`

**Features:**
- List all teams
- Get team information and channels
- Create new teams
- Add/remove team members
- List team members

**Usage:**
```powershell
# Connect first
Connect-MgGraph -Scopes "Team.ReadBasic.All","TeamMember.ReadWrite.All"

# List all teams
.\Manage-Teams.ps1 -Action List

# Get team info
.\Manage-Teams.ps1 -Action Info -TeamId "team-id-here"

# Create a new team
.\Manage-Teams.ps1 -Action Create -TeamName "Project Team" -Description "Team for project collaboration"

# Add a member
.\Manage-Teams.ps1 -Action AddMember -TeamId "team-id" -UserPrincipalName "user@contoso.com"

# Remove a member
.\Manage-Teams.ps1 -Action RemoveMember -TeamId "team-id" -UserPrincipalName "user@contoso.com"

# List members
.\Manage-Teams.ps1 -Action ListMembers -TeamId "team-id"
```

### Manage-ExchangeOnline.ps1

Manage Exchange Online mailboxes and settings.

**Prerequisites:**
- ExchangeOnlineManagement module
- Connected to Exchange Online: `Connect-ExchangeOnline`

**Features:**
- List mailboxes
- Get mailbox information
- Get mailbox statistics
- Set automatic replies (out of office)
- Get forwarding rules
- List distribution groups

**Usage:**
```powershell
# Connect first
Connect-ExchangeOnline

# List mailboxes (first 100)
.\Manage-ExchangeOnline.ps1 -Action List

# Get mailbox info
.\Manage-ExchangeOnline.ps1 -Action Info -Identity "user@contoso.com"

# Get mailbox statistics
.\Manage-ExchangeOnline.ps1 -Action GetMailboxStats -Identity "user@contoso.com"
```

### Discover-M365Tenant.ps1

Discovers Microsoft 365 tenant details.

**Prerequisites:**
- Microsoft.Graph module
- Connected to Microsoft Graph: `Connect-MgGraph`

**Features:**
- Organization details
- Verified domains
- Subscribed SKUs
- JSON/CSV export with logs

**Usage:**
```powershell
# Tenant discovery
Connect-MgGraph -Scopes "Organization.Read.All","Domain.Read.All"
.\Discover-M365Tenant.ps1

# Export JSON and CSV
.\Discover-M365Tenant.ps1 -Format Both
```

# Enable auto-reply
.\Manage-ExchangeOnline.ps1 -Action SetAutoReply -Identity "user@contoso.com" -AutoReplyMessage "I'm out of office" -EnableAutoReply $true

# Disable auto-reply
.\Manage-ExchangeOnline.ps1 -Action SetAutoReply -Identity "user@contoso.com" -EnableAutoReply $false

# Get forwarding rules
.\Manage-ExchangeOnline.ps1 -Action GetForwardingRules -Identity "user@contoso.com"

# List distribution groups
.\Manage-ExchangeOnline.ps1 -Action ListDistributionGroups
```

## Authentication

### Microsoft Graph

```powershell
# Interactive login
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"

# See required scopes for each operation in script documentation
Get-Help .\Manage-O365Users.ps1 -Full

# Verify connection
Get-MgContext

# Disconnect
Disconnect-MgGraph
```

### Exchange Online

```powershell
# Interactive login
Connect-ExchangeOnline

# With specific user
Connect-ExchangeOnline -UserPrincipalName admin@contoso.com

# Verify connection
Get-ConnectionInformation

# Disconnect
Disconnect-ExchangeOnline
```

## Required Permissions

### For User Management
- User.ReadWrite.All (for creating/modifying users)
- User.Read.All (for reading user information)

### For Teams Management
- Team.ReadBasic.All (for reading teams)
- TeamMember.ReadWrite.All (for managing team members)
- Group.ReadWrite.All (for creating teams)

### For Exchange Online
- Exchange Administrator role or higher
- Global Administrator for full access

## Best Practices

1. **Use least privilege principle**: Only request the scopes you need
2. **Test with test users**: Always test user management scripts with test accounts first
3. **Document changes**: Keep track of administrative changes
4. **Regular password resets**: Enforce password policies and regular resets
5. **Monitor privileged accounts**: Keep an eye on admin accounts
6. **Use MFA**: Ensure Multi-Factor Authentication is enabled
7. **Review licenses**: Check license assignments before creating users

## Common Issues

**Issue**: "Connect-MgGraph command not found"
```powershell
# Solution: Install the Microsoft.Graph module
Install-Module -Name Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force
```

**Issue**: "Insufficient privileges to complete the operation"
```powershell
# Solution: Connect with appropriate scopes
Disconnect-MgGraph
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"
```

**Issue**: "Cannot access Exchange Online"
```powershell
# Solution: Install and connect to Exchange Online
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser
Connect-ExchangeOnline
```

**Issue**: "User already exists"
```
Solution: Check if the user already exists before creating. Use Get-MgUser to verify.
```

## Security Considerations

1. **Store credentials securely**: Never hardcode credentials in scripts
2. **Use managed identities**: When running automated scripts in Azure
3. **Audit logs**: Regularly review audit logs for administrative actions
4. **Conditional Access**: Configure conditional access policies
5. **Privileged Identity Management**: Use PIM for time-limited admin access

## Additional Resources

- [Microsoft Graph PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/microsoftgraph/)
- [Exchange Online PowerShell](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell)
- [Microsoft 365 Admin Center](https://admin.microsoft.com/)
- [Microsoft Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer)
- [Microsoft 365 Compliance Center](https://compliance.microsoft.com/)
