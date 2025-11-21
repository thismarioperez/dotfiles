# Tmux Keybindings Reference

This document provides a comprehensive reference for all custom tmux keybindings defined in `2-keybindings.tmux`.

> **Note:** Unless specified as "No prefix required", all keybindings require pressing the tmux prefix key first (typically `Ctrl-b` or `Ctrl-a` depending on your configuration).

## Keybindings Table

| Keybinding         | Description                               | Category           | Notes                                                           |
| ------------------ | ----------------------------------------- | ------------------ | --------------------------------------------------------------- |
| `Shift-R`          | Reload tmux configuration                 | Configuration      | Displays confirmation message                                   |
| `` ` `` (backtick) | Switch to marked window                   | Navigation         |                                                                 |
| `Tab`              | Switch to last window                     | Window Management  | Restores default `l` functionality                              |
| `Alt-Up`           | Select pane above                         | Pane Navigation    | No prefix required                                              |
| `Alt-Down`         | Select pane below                         | Pane Navigation    | No prefix required                                              |
| `Alt-Left`         | Select pane to the left                   | Pane Navigation    | No prefix required                                              |
| `Alt-Right`        | Select pane to the right                  | Pane Navigation    | No prefix required                                              |
| `k`                | Select pane above (vim-style)             | Pane Navigation    | Repeatable                                                      |
| `j`                | Select pane below (vim-style)             | Pane Navigation    | Repeatable                                                      |
| `h`                | Select pane to the left (vim-style)       | Pane Navigation    | Repeatable                                                      |
| `l`                | Select pane to the right (vim-style)      | Pane Navigation    | Repeatable, overrides default "last window"                     |
| `Ctrl-k`           | Resize pane up by 5 lines                 | Pane Resizing      | Repeatable                                                      |
| `Ctrl-j`           | Resize pane down by 5 lines               | Pane Resizing      | Repeatable                                                      |
| `Ctrl-h`           | Resize pane left by 5 columns             | Pane Resizing      | Repeatable                                                      |
| `Ctrl-l`           | Resize pane right by 5 columns            | Pane Resizing      | Repeatable                                                      |
| `"` (quote)        | Split window horizontally                 | Pane Management    | Enhanced default, opens in current path                         |
| `%`                | Split window vertically                   | Pane Management    | Enhanced default, opens in current path                         |
| `\|` (pipe)        | Split window horizontally (alias)         | Pane Management    | Alternative to `"`, opens in current path                       |
| `-` (dash)         | Split window vertically (alias)           | Pane Management    | Alternative to `%`, opens in current path                       |
| `Shift-T`          | Open new terminal in popup                | Popup              | Opens in current path                                           |
| `Shift-D`          | Open LazyDocker in popup                  | Popup              | 90% width/height, overrides default "Choose client"             |
| `Shift-G`          | Open LazyGit in popup                     | Popup              | 90% width/height                                                |
| `Shift-O`          | Session switcher/creator with preview     | Session Management | Find, create, or switch sessions with fzf                       |
| `Ctrl-d`           | Delete session(s) interactively           | Session Management | Multi-select with Tab, Ctrl-a to select all                     |
| `Shift-F`          | Create session from projects directory    | Session Management | Searches ~/Repositories, ~/repositories, $XDG_DATA_HOME, etc.   |
| `Shift-W`          | Window switcher with preview              | Window Management  | Switch between windows with fzf preview                         |

## Category Details

### Configuration

-   **Reload Configuration (`Shift-R`)**: Reloads the tmux configuration from `$XDG_CONFIG_HOME/tmux/tmux.conf`

### Pane Navigation

-   **Alt-Arrow Keys**: Direct pane switching without prefix (useful for quick navigation)
-   **Vim-style (h/j/k/l)**: Alternative navigation using vim keybindings (repeatable)

### Pane Resizing

-   **Vim-style with Ctrl**: Use `Ctrl-h/j/k/l` to resize panes in 5-unit increments (repeatable)

### Pane Management

-   **Split Windows**:
    -   Default keys `"` and `%` are enhanced to maintain current working directory
    -   Alternative keys `|` (horizontal) and `-` (vertical) available as visual aliases
    -   All split commands preserve your current path

### Popups

Interactive popup windows that overlay the current session:

-   **Terminal (`Shift-T`)**: Quick terminal access
-   **LazyDocker (`Shift-D`)**: Docker container management UI
-   **LazyGit (`Shift-G`)**: Git repository management UI

### Session Management

Advanced session management with fuzzy finding (fzf):

-   **Session Switcher (`Shift-O`)**:
    -   Find existing sessions or create new ones
    -   Preview session contents
    -   `Ctrl-x` to delete a session
    -   Enter query to create new session if it doesn't exist
-   **Delete Sessions (`Ctrl-d`)**: Interactively delete multiple sessions (Tab for multi-select, Ctrl-a to select all)
-   **Project Sessions (`Shift-F`)**: Create sessions from project directories

### Window Management

-   **Last Window (`Tab`)**: Quick toggle to previously active window
-   **Window Switcher (`Shift-W`)**: Fuzzy find and switch between windows with preview

## Tips

1. **Repeatable Keys**: Keybindings marked as "Repeatable" can be pressed multiple times without re-entering the prefix key.
2. **No Prefix**: Alt-arrow key combinations work without the prefix key for faster navigation.
3. **Current Path**: Split commands and some popups automatically use your current pane's working directory.
4. **FZF Navigation**: Session and window switchers use fzf for fuzzy finding. Use arrow keys to navigate, Enter to select, and Tab for multi-select where applicable.
