# Dotfiles

## Supported Systems
| Operating System | Supported? |
|------------------|------------|
| macOS            | ✅          |
| Ubuntu/Debian    | ✅          |
| Fedora           | ❌          |
| Arch             | ❌          |
| Windows          | ❌          |

## System Requirements
macOS
- (homebrew)[https://brew.sh/]
- git
- zsh
- chezmoi

Install with:
```shell
brew update && brew install git zsh chezmoi
```

Debian Linux (e.g. Ubuntu/WSL/Turnkey)
- git
- zsh
- chezmoi

Install with:
```shell
sudo apt update && sudo apt install git zsh chezmoi && chsh -s $(which zsh)
# Then log out and back in to activate zsh
```

## Usage
Dotfiles are managed with (chezmoi)[https://www.chezmoi.io/].
To get started on a new system, first, make sure you meet the system requirements. Then, run:
```
chezmoi init https://github.com/thismarioperez/dotfiles.git
```