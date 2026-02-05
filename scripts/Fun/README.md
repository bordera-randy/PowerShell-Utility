# Fun Scripts

This directory contains entertaining and visually appealing PowerShell scripts to brighten your day and show off PowerShell's capabilities!

## Available Scripts

### Get-ASCIIArt.ps1

Generate ASCII art text with different styles and fonts.

**Features:**
- Multiple art styles (Banner, Block, Simple, Random)
- Colorful output
- Custom text input
- Pre-defined PowerShell banner

**Usage:**
```powershell
# Default PowerShell banner
.\Get-ASCIIArt.ps1

# Custom text with different styles
.\Get-ASCIIArt.ps1 -Text "Hello World" -Style Banner
.\Get-ASCIIArt.ps1 -Text "DEVOPS" -Style Block
.\Get-ASCIIArt.ps1 -Text "Welcome" -Style Simple

# Random fun art
.\Get-ASCIIArt.ps1 -Style Random
```

**Styles:**
- **Banner**: Large PowerShell banner art
- **Block**: Block letters with box drawing characters (supports A-Z and space)
- **Simple**: Text in a decorative box
- **Random**: Random fun ASCII art characters

**Examples:**

Block style:
```
 █████╗ 
██╔══██╗
███████║
██╔══██║
██║  ██║
╚═╝  ╚═╝
```

Simple style:
```
  ╔═══════════════════════════════════════════╗
  ║                                           ║
  ║   Hello World                             ║
  ║                                           ║
  ╚═══════════════════════════════════════════╝
```

### Get-SystemInfo.ps1

Display comprehensive system information in a beautiful, colorful format.

**Features:**
- Computer information (name, domain, manufacturer, model, RAM)
- Operating system details
- Processor information
- Disk space with color-coded alerts
- Network adapter information
- Optional detailed information (PowerShell version, .NET, user, antivirus)
- Color-coded status indicators

**Usage:**
```powershell
# Basic system information
.\Get-SystemInfo.ps1

# Include detailed information
.\Get-SystemInfo.ps1 -Detailed
```

**Output includes:**
- ASCII art banner
- Computer details
- OS information and uptime
- CPU specifications
- Disk space with health status (green/yellow/red indicators)
- Active network adapters with IP addresses
- Additional details in detailed mode

**Example Output:**
```
 ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
 ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
 ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
 ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
 ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
 ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝

╔══════════════════════════════════════════════════════════╗
║              COMPUTER INFORMATION                        ║
╚══════════════════════════════════════════════════════════╝

  Computer Name:     DESKTOP-ABC123
  Domain:            WORKGROUP
  Total RAM:         16.00 GB
  ...
```

### Get-RandomQuote.ps1

Display random inspirational, tech, or funny quotes to motivate your day!

**Features:**
- Multiple quote categories
- Beautiful ASCII art header
- Random quote selection
- Color-coded output

**Usage:**
```powershell
# Random quote from all categories
.\Get-RandomQuote.ps1

# Tech quotes
.\Get-RandomQuote.ps1 -Category Tech

# Inspirational quotes
.\Get-RandomQuote.ps1 -Category Inspirational

# Funny quotes
.\Get-RandomQuote.ps1 -Category Funny
```

**Categories:**
- **Tech**: Programming and technology quotes
- **Inspirational**: Motivational and leadership quotes  
- **Funny**: Humorous developer quotes
- **All**: Mix of all categories

**Example Output:**
```
  ██████╗ ██╗   ██╗ ██████╗ ████████╗███████╗
 ██╔═══██╗██║   ██║██╔═══██╗╚══██╔══╝██╔════╝
 ██║   ██║██║   ██║██║   ██║   ██║   █████╗  
 ██║▄▄ ██║██║   ██║██║   ██║   ██║   ██╔══╝  
 ╚██████╔╝╚██████╔╝╚██████╔╝   ██║   ███████╗
  ╚══▀▀═╝  ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝

 ╔═╗╔═╗  ╔╦╗╦ ╦╔═╗  ╔╦╗╔═╗╦ ╦
 ║ ║╠╣    ║ ╠═╣║╣    ║║╠═╣╚╦╝
 ╚═╝╚     ╩ ╩ ╩╚═╝  ═╩╝╩ ╩ ╩ 

╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║  Code is like humor. When you have to explain it, it's bad.              ║
║                                                                           ║
║ - Cory House                                                              ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

## Fun Use Cases

### PowerShell Profile

Add these to your PowerShell profile for a fun startup:

```powershell
# Add to $PROFILE

# Show a random quote when PowerShell starts
C:\Path\To\Scripts\Fun\Get-RandomQuote.ps1 -Category All

# Or show ASCII art
C:\Path\To\Scripts\Fun\Get-ASCIIArt.ps1 -Text "READY" -Style Block
```

### Team Presentations

```powershell
# Create impressive system info displays for demos
.\Get-SystemInfo.ps1 -Detailed

# Generate custom ASCII art for team names
.\Get-ASCIIArt.ps1 -Text "DevOps Team" -Style Block
```

### Daily Motivation

```powershell
# Create a scheduled task to show daily quotes
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\Fun\Get-RandomQuote.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Daily Motivation"
```

### Terminal Customization

```powershell
# Use ASCII art for custom prompts
function prompt {
    # Your custom prompt with ASCII elements
    Write-Host "╔═══" -NoNewline -ForegroundColor Cyan
    Write-Host "[PS]" -NoNewline -ForegroundColor Green
    Write-Host "═══╗" -ForegroundColor Cyan
    Write-Host "╚> " -NoNewline -ForegroundColor Cyan
    return " "
}
```

### Meeting Icebreakers

```powershell
# Start team meetings with a random quote
.\Get-RandomQuote.ps1 -Category Funny

# Or show off system specs in a fun way
.\Get-SystemInfo.ps1
```

## Customization Ideas

### Add Your Own Quotes

Edit `Get-RandomQuote.ps1` to add your own quotes:

```powershell
$customQuotes = @(
    @{
        Quote = "Your custom quote here"
        Author = "Your Name"
    }
)
```

### Create Custom ASCII Art

Use online ASCII art generators and add them to `Get-ASCIIArt.ps1`:
- [patorjk.com](http://patorjk.com/software/taag/)
- [ASCII Art Generator](https://www.ascii-art-generator.org/)

### Extend System Info

Add custom sections to `Get-SystemInfo.ps1`:

```powershell
function Get-CustomInfo {
    Write-Host "╔══════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║              CUSTOM SECTION                              ║" -ForegroundColor Green
    Write-Host "╚══════════════════════════════════════════════════════════╝" -ForegroundColor Green
    # Your custom information here
}
```

## Tips and Tricks

1. **Pipe to Out-File**: Save ASCII art to text files
   ```powershell
   .\Get-ASCIIArt.ps1 -Text "LOGO" -Style Block | Out-File "logo.txt"
   ```

2. **Combine Scripts**: Create combo displays
   ```powershell
   .\Get-ASCIIArt.ps1 -Style Random
   .\Get-RandomQuote.ps1 -Category Tech
   ```

3. **Screenshot**: Share your colorful output
   - Use Windows Snipping Tool or Snip & Sketch
   - PowerShell's colors make great screenshots

4. **Terminal Theming**: Works great with:
   - Windows Terminal
   - PowerShell 7
   - VS Code integrated terminal

## Fun Facts

- ASCII art has been around since the 1960s
- PowerShell can display 16 different colors
- Box drawing characters (╔═╗) are part of Unicode
- The first ASCII art was created on teletypes

## Contributing Your Fun Scripts

Have a fun PowerShell script idea? Contribute it!

Ideas for new scripts:
- Weather display
- Countdown timers  
- Progress bars and animations
- Interactive games
- Matrix-style effects
- Color palettes
- Banner generators

## Additional Resources

- [ASCII Art Archive](https://www.asciiart.eu/)
- [Box Drawing Characters](https://en.wikipedia.org/wiki/Box-drawing_character)
- [PowerShell Gallery - PSColor](https://www.powershellgallery.com/)
- [ANSI Escape Codes](https://en.wikipedia.org/wiki/ANSI_escape_code)

---

**Remember**: PowerShell isn't just for serious work - have some fun with it! 🎨🚀