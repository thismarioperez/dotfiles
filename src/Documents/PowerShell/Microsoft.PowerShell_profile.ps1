# Setup environment
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:XDG_DATA_HOME = "$HOME\.local\share"

# Load oh-my-posh
oh-my-posh init pwsh --config "$env:XDG_DATA_HOME\oh-my-posh\themes\thismarioperez.omp.json" | Invoke-Expression

# Load terminal icons
if (Get-Module -ListAvailable -Name Terminal-Icons) {
    # Run this to install the module: 
    # ```
    # Install-Module -Name Terminal-Icons -Repository PSGallery -Force
    #```
    Import-Module -Name Terminal-Icons
}

# Make it easy to edit this profile once it's installed
# We're only targeting the current user, all hosts profile
function Edit-Profile {
    code $PROFILE
}

# Easy reload profile
function Reload-Profile {
    & $PROFILE
}

# Set UNIX-like aliases for the list command
function ll { Get-ChildItem -Path $pwd -File }
