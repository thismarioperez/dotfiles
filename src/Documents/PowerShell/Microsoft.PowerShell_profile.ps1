# Setup environment
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:XDG_DATA_HOME = "$HOME\.local\share"

# Load oh-my-posh
oh-my-posh init pwsh --config "$env:XDG_DATA_HOME\oh-my-posh\themes\thismarioperez.omp.json" | Invoke-Expression