# Dotfiles

## Supported Systems
| Operating System | Supported? |
|------------------|------------|
| macOS            | ✅          |
| Ubuntu/Debian    | ❌          |
| Fedora           | ❌          |
| Arch             | ❌          |
| Windows          | ❌          |

## System Requirements
macOS
- (homebrew)[https://brew.sh/]
- git `brew install git`
- zsh `brew install zsh`
- chezmoi `brew install chezmoi`

## Usage
Dotfiles are managed with (chezmoi)[https://www.chezmoi.io/]. To get started on a new system, first, make sure you meet the system requirements. Then, run:
```
chezmoi init https://github.com/thismarioperez/dotfiles.git
```