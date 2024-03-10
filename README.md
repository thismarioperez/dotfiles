# Dotfiles

## Supported Systems

| Operating System | Supported? |
| ---------------- | ---------- |
| macOS            | ✅         |
| Ubuntu           | ✅         |
| Fedora           | ❌         |
| Arch             | ❌         |
| Windows          | ❌         |

## System Requirements

macOS

-   [homebrew](https://brew.sh/)
-   git
-   zsh
-   chezmoi

Install with:

```shell
brew update && brew install git zsh chezmoi
```

Ubuntu Linux

-   git
-   zsh
-   chezmoi

Install with:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" && \
sudo apt update && sudo apt install git zsh && chsh -s $(which zsh)
```

**Make sure you log out/in to activate zsh**

## Usage

Dotfiles are managed with [chezmoi](https://www.chezmoi.io/).
To get started on a new system, first, make sure you meet the system requirements. Then, run:

```
chezmoi init --apply --verbose https://github.com/thismarioperez/dotfiles.git
```
