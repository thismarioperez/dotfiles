# Dotfiles

## Supported Systems

| Operating System | Supported? |
| ---------------- | ---------- |
| macOS            | ✅         |
| Ubuntu           | ✅         |
| Fedora           | ❌         |
| Arch             | ❌         |
| Windows          | ✅         |

## System Requirements

macOS

-   [homebrew](https://brew.sh/)
-   git
-   zsh
-   chezmoi

Install with:

```sh
brew update && brew install git zsh chezmoi
```

Ubuntu Linux

-   [apt](https://wiki.debian.org/Apt)
-   git
-   zsh
-   chezmoi

Install with:

```sh
echo "PATH=\"\$HOME/bin:\$PATH\"" >> ~/.zshrc && \
sh -c "$(curl -fsLS get.chezmoi.io)" && \
sudo apt update && sudo apt install git zsh && chsh -s $(which zsh)
```

**Make sure you log out/in to activate zsh**

Windows

-   [Winget](https://github.com/microsoft/winget-cli)
-   Git for Windows
-   Microsoft Windows terminal
-   chezmoi

Install with:

```ps1
winget install Git.Git --accept-package-agreements --accept-source-agreements ; winget install Microsoft.WindowsTerminal --accept-package-agreements --accept-source-agreements ; winget install twpayne.chezmoi --accept-package-agreements --accept-source-agreements ; winget install Microsoft.PowerShell --accept-package-agreements --accept-source-agreements ;
```

## Usage

Dotfiles are managed with [chezmoi](https://www.chezmoi.io/).
To get started on a new system, first, make sure you meet the system requirements. Then, run:

```
chezmoi init --apply --verbose https://github.com/thismarioperez/dotfiles.git
```

### Themes

All custom themes are based on the [Night Owl](https://github.com/sdras/night-owl-vscode-theme) color palette.

|         | Normal                                              | Bright                                     |
| ------- | --------------------------------------------------- | ------------------------------------------ |
| Black   | `#011627`<br>`editor.background`                    | `#44596b`<br>`activityBarBadge.background` |
| Red     | `#f78c6c`<br>`Number`                               | `#ef5350`<br>`errorForeground`             |
| Green   | `#addb67`<br>`String`                               | `#22da6e`<br>`terminal.ansiBrightGreen`    |
| Yellow  | `#ffcb8b`<br>`Class name`                           | `#ffeb95`<br>`Constant Other Color`        |
| Blue    | `#82aaff`<br>`Built-in constant`<br>`Function name` | `#5ca7e4`<br>`RegExp String`               |
| Magenta | `#c792ea`<br>`Keyword`                              | `#7e57c2`<br>`button.hoverBackground`      |
| Cyan    | `#7fdbca`<br>`Meta tag`                             | `#21c7a8`<br>`terminal.ansiCyan`           |
| White   | `#bec5d4`<br>`PHP Variables`                        | `#ffffff`<br>`Object Comma`                |
