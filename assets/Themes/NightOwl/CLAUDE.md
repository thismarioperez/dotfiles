# Night Owl Theme Regeneration Instructions

## Overview

This document provides complete instructions for an AI agent to regenerate the Night Owl theme reference files (`colors.json` and `README.md`) from their upstream sources. Use this context when updates are available from the original theme authors to ensure this reference stays current.

## Source URLs

Fetch the latest theme data from these URLs:

1. **Gogh Terminal Theme (YAML)**

    - URL: `https://raw.githubusercontent.com/Gogh-Co/Gogh/master/themes/Night%20Owl.yml`
    - Format: YAML
    - Contains: 16 ANSI terminal colors, background, foreground, cursor

2. **VS Code Theme (JSON)**
    - URL: `https://raw.githubusercontent.com/sdras/night-owl-vscode-theme/main/themes/Night%20Owl-color-theme.json`
    - Format: JSON
    - Contains: Comprehensive UI colors, syntax highlighting colors, editor colors

## Data Extraction Instructions

### Gogh YAML Structure

The Gogh theme contains these key fields:

```yaml
color_01: "#011627" # Black (Host)
color_02: "#EF5350" # Red (Syntax string)
color_03: "#22DA6E" # Green (Command)
color_04: "#ADDB67" # Yellow (Command second)
color_05: "#82AAFF" # Blue (Path)
color_06: "#C792EA" # Magenta (Syntax var)
color_07: "#21C7A8" # Cyan (Prompt)
color_08: "#FFFFFF" # White

color_09: "#575656" # Bright Black
color_10: "#EF5350" # Bright Red (Command error)
color_11: "#22DA6E" # Bright Green (Exec)
color_12: "#FFEB95" # Bright Yellow
color_13: "#82AAFF" # Bright Blue (Folder)
color_14: "#C792EA" # Bright Magenta
color_15: "#7FDBCA" # Bright Cyan
color_16: "#FFFFFF" # Bright White

background: "#011627" # Background
foreground: "#D6DEEB" # Foreground (Text)
cursor: "#D6DEEB" # Cursor
```

### VS Code JSON Structure

The VS Code theme has two main sections:

1. **colors** object - Contains UI element colors:

    - Keys like `editor.background`, `sidebar.foreground`, `tab.activeBackground`
    - Direct hex color values

2. **tokenColors** array - Contains syntax highlighting rules:
    - Each entry has `scope` (what it applies to) and `settings.foreground` (the color)
    - Extract colors from the settings objects

## colors.json Generation

### File Structure

Generate a JSON file with this hierarchical structure:

```json
{
  "core": { ... },
  "ansi": { "normal": { ... }, "bright": { ... } },
  "syntax": { ... },
  "ui": { "editor": { ... }, "tab": { ... }, ... },
  "accent": { ... },
  "diagnostic": { ... },
  "diff": { ... },
  "git": { ... }
}
```

### Field Mappings

#### Core Section (from Gogh YAML)

```
core.background    ← background
core.foreground    ← foreground
core.cursor        ← cursor
```

#### ANSI Section (from Gogh YAML)

```
ansi.normal.black     ← color_01
ansi.normal.red       ← color_02
ansi.normal.green     ← color_03
ansi.normal.yellow    ← color_04
ansi.normal.blue      ← color_05
ansi.normal.magenta   ← color_06
ansi.normal.cyan      ← color_07
ansi.normal.white     ← color_08

ansi.bright.black     ← color_09
ansi.bright.red       ← color_10
ansi.bright.green     ← color_11
ansi.bright.yellow    ← color_12
ansi.bright.blue      ← color_13
ansi.bright.magenta   ← color_14
ansi.bright.cyan      ← color_15
ansi.bright.white     ← color_16
```

#### Syntax Section (from VS Code JSON tokenColors)

Extract colors from `tokenColors` array based on scope patterns. Look for these common scopes:

```
syntax.keyword     ← scope: "keyword" (typically purple/magenta)
syntax.function    ← scope: "entity.name.function" (typically blue)
syntax.type        ← scope: "entity.name.type" (typically peach/orange)
syntax.class       ← scope: "entity.name.type.class" (same as type)
syntax.constant    ← scope: "constant" (typically orange)
syntax.number      ← scope: "constant.numeric" (same as constant)
syntax.string      ← scope: "string" (typically yellow/tan)
syntax.stringAlt   ← Alternative string color if present
syntax.comment     ← scope: "comment" (typically muted gray)
syntax.variable    ← scope: "variable" (typically foreground color)
syntax.parameter   ← scope: "variable.parameter"
syntax.operator    ← scope: "keyword.operator"
syntax.punctuation ← scope: "punctuation" (typically cyan/teal)
syntax.tag         ← scope: "entity.name.tag" (HTML/JSX tags)
syntax.attribute   ← scope: "entity.other.attribute-name"
syntax.property    ← scope: "variable.other.property"
syntax.regex       ← scope: "string.regexp"
syntax.boolean     ← scope: "constant.language.boolean"
syntax.null        ← scope: "constant.language.null"
syntax.this        ← scope: "variable.language.this"
syntax.support     ← scope: "support.function"
```

#### UI Section (from VS Code JSON colors object)

Map UI elements from the `colors` object:

```json
ui.editor: {
  "background": "editor.background",
  "foreground": "editor.foreground",
  "lineHighlight": "editor.lineHighlightBackground",
  "selection": "editor.selectionBackground",
  "selectionHighlight": "editor.selectionHighlightBackground",
  "inactiveSelection": "editor.inactiveSelectionBackground",
  "findMatch": "editor.findMatchBackground",
  "findMatchHighlight": "editor.findMatchHighlightBackground",
  "wordHighlight": "editor.wordHighlightBackground",
  "wordHighlightStrong": "editor.wordHighlightStrongBackground",
  "hoverHighlight": "editor.hoverHighlightBackground"
}

ui.editorLineNumber: {
  "foreground": "editorLineNumber.foreground",
  "activeForeground": "editorLineNumber.activeForeground"
}

ui.editorCursor: {
  "foreground": "editorCursor.foreground"
}

ui.editorIndentGuide: {
  "background": "editorIndentGuide.background",
  "activeBackground": "editorIndentGuide.activeBackground"
}

ui.editorGutter: {
  "background": "editorGutter.background",
  "modified": "editorGutter.modifiedBackground",
  "added": "editorGutter.addedBackground",
  "deleted": "editorGutter.deletedBackground"
}

ui.editorWidget: {
  "background": "editorWidget.background",
  "border": "editorWidget.border"
}

ui.sidebar: {
  "background": "sideBar.background",
  "foreground": "sideBar.foreground",
  "border": "sideBar.border"
}

ui.sidebarTitle: {
  "foreground": "sideBarTitle.foreground"
}

ui.activityBar: {
  "background": "activityBar.background",
  "foreground": "activityBar.foreground",
  "border": "activityBar.border"
}

ui.activityBarBadge: {
  "background": "activityBarBadge.background",
  "foreground": "activityBarBadge.foreground"
}

ui.tab: {
  "activeBackground": "tab.activeBackground",
  "activeForeground": "tab.activeForeground",
  "activeBorder": "tab.activeBorder",
  "inactiveBackground": "tab.inactiveBackground",
  "inactiveForeground": "tab.inactiveForeground",
  "border": "tab.border"
}

ui.statusBar: {
  "background": "statusBar.background",
  "foreground": "statusBar.foreground"
}

ui.panel: {
  "background": "panel.background",
  "border": "panel.border"
}

ui.terminal: {
  "background": "terminal.background",
  "foreground": "terminal.foreground"
}

ui.list: {
  "activeSelectionBackground": "list.activeSelectionBackground",
  "activeSelectionForeground": "list.activeSelectionForeground",
  "inactiveSelectionBackground": "list.inactiveSelectionBackground",
  "inactiveSelectionForeground": "list.inactiveSelectionForeground",
  "hoverBackground": "list.hoverBackground",
  "hoverForeground": "list.hoverForeground",
  "focusBackground": "list.focusBackground",
  "focusForeground": "list.focusForeground"
}

ui.input: {
  "background": "input.background",
  "foreground": "input.foreground",
  "border": "input.border",
  "placeholderForeground": "input.placeholderForeground"
}

ui.dropdown: {
  "background": "dropdown.background",
  "foreground": "dropdown.foreground",
  "border": "dropdown.border"
}

ui.button: {
  "background": "button.background",
  "foreground": "button.foreground",
  "hoverBackground": "button.hoverBackground"
}

ui.badge: {
  "background": "badge.background",
  "foreground": "badge.foreground"
}

ui.scrollbar: {
  "shadow": "scrollbar.shadow",
  "sliderBackground": "scrollbarSlider.background",
  "sliderHoverBackground": "scrollbarSlider.hoverBackground",
  "sliderActiveBackground": "scrollbarSlider.activeBackground"
}

ui.breadcrumb: {
  "foreground": "breadcrumb.foreground",
  "focusForeground": "breadcrumb.focusForeground",
  "activeSelectionForeground": "breadcrumb.activeSelectionForeground"
}
```

#### Accent Section

Extract commonly used accent colors that appear frequently in the VS Code theme:

```
accent.purple          ← button.background (typically #7e57c2)
accent.purpleLight     ← breadcrumb.foreground (typically #a599e9)
accent.mutedBlue       ← Common border color (typically #5f7e97)
accent.mutedBlueLight  ← sidebar.foreground (typically #89a4bb)
accent.teal            ← Bright cyan from ANSI (typically #7fdbca)
accent.tealDark        ← Normal cyan from ANSI (typically #21c7a8)
accent.orange          ← Constant color (typically #f78c6c)
accent.peach           ← Type color (typically #ffcb8b)
accent.pink            ← Boolean color (typically #ff5874)
accent.yellowBright    ← Bright yellow from ANSI (typically #ffeb95)
accent.yellowMuted     ← String color (typically #ecc48d)
```

#### Diagnostic Section

```
diagnostic.error       ← editorError.foreground
diagnostic.warning     ← inputValidation.warningBorder
diagnostic.warningAlt  ← editorWarning.foreground
diagnostic.info        ← inputValidation.infoBorder
diagnostic.hint        ← Use blue/function color
```

#### Diff Section

```
diff.insertedBackground ← diffEditor.insertedTextBackground
diff.removedBackground  ← diffEditor.removedTextBackground
```

#### Git Section

```
git.modified   ← editorGutter.modifiedBackground
git.added      ← editorGutter.addedBackground
git.deleted    ← editorGutter.deletedBackground
git.untracked  ← Use teal/cyan color
git.ignored    ← Use muted color
```

### Naming Conventions

-   Use camelCase for all property names
-   Group related colors under nested objects
-   Keep hex values lowercase
-   Preserve alpha channel values when present (e.g., `#7e57c2cc`)

## README.md Generation

### File Structure

Generate a markdown file with these sections in order:

1. Title and description
2. Core Colors (table)
3. ANSI Colors (Terminal) - subsections for Normal and Bright
4. Syntax Colors (table)
5. UI Colors (multiple subsections: Editor, Tabs, Sidebar & Activity Bar, Lists, Input & Buttons)
6. Accent Colors (table)
7. Diagnostic Colors (table)
8. Git Colors (table)
9. Sources (links to upstream repos)

### Table Format

Use this format for all color tables:

```markdown
| Color                                                                 | Hex        | Usage             |
| --------------------------------------------------------------------- | ---------- | ----------------- |
| ![#hexcode](https://via.placeholder.com/15/hexcode/hexcode.png) Label | `#hexcode` | Usage description |
```

**Important**:

-   The placeholder URL format is: `https://via.placeholder.com/15/HEXCODE/HEXCODE.png` (no # symbol in URL)
-   Remove the `#` from hex codes in the placeholder URL
-   Keep the `#` in the inline code backticks

### Color Labels and Usage Descriptions

Use these consistent labels and descriptions:

#### Core Colors

-   Background: "Main editor and UI background"
-   Foreground: "Main text color"
-   Cursor: "Cursor color"

#### ANSI Normal

-   Black: "Terminal black (host)"
-   Red: "Terminal red (errors, strings)"
-   Green: "Terminal green (commands)"
-   Yellow: "Terminal yellow"
-   Blue: "Terminal blue (paths)"
-   Magenta: "Terminal magenta (variables)"
-   Cyan: "Terminal cyan (prompts)"
-   White: "Terminal white"

#### ANSI Bright

-   Bright Black: "Terminal bright black (comments)"
-   Bright Red: "Terminal bright red (errors)"
-   Bright Green: "Terminal bright green (execution)"
-   Bright Yellow: "Terminal bright yellow"
-   Bright Blue: "Terminal bright blue (folders)"
-   Bright Magenta: "Terminal bright magenta"
-   Bright Cyan: "Terminal bright cyan"
-   Bright White: "Terminal bright white"

#### Syntax Colors

-   Keyword: "Keywords, operators, storage types"
-   Function: "Function names, methods, this keyword"
-   Type: "Classes, types, interfaces"
-   Constant: "Constants, numbers, built-ins"
-   String: "String literals (primary)"
-   String Alt: "String literals (alternate), attributes"
-   Comment: "Comments, documentation"
-   Variable: "Variables, properties"
-   Parameter: "Function parameters"
-   Tag/Punctuation: "HTML/JSX tags, punctuation"
-   Regex: "Regular expressions"
-   Boolean/Null: "Boolean values, null, undefined"

#### UI Editor

-   Line Highlight: "Current line background"
-   Selection: "Text selection"
-   Line Number: "Line numbers"
-   Active Line Number: "Active line number"
-   Editor Cursor: "Editor cursor color"
-   Widget Background: "Autocomplete, hover widgets"

#### UI Tabs

-   Active Tab: "Active tab background"
-   Active Tab Text: "Active tab text"
-   Inactive Tab: "Inactive tab background"
-   Inactive Tab Text: "Inactive tab text"

#### UI Sidebar & Activity Bar

-   Sidebar Foreground: "Sidebar text"
-   Sidebar Title: "Sidebar section titles"
-   Badge Background: "Activity bar badges"

#### UI Lists

-   Active Selection: "Active list item selection"
-   Inactive Selection: "Inactive list item selection"
-   Focus Background: "Focused list item"

#### UI Input & Buttons

-   Input Background: "Input field background"
-   Button Background: "Button background"

#### Accent Colors

-   Purple: "Primary accent, buttons"
-   Purple Light: "Breadcrumbs, light accents"
-   Muted Blue: "Borders, secondary UI"
-   Muted Blue Light: "Lighter secondary UI"
-   Teal: "Tags, highlights"
-   Teal Dark: "Darker teal variant"
-   Orange: "Numbers, constants"
-   Peach: "Types, classes"
-   Pink: "Booleans, special values"
-   Yellow Bright: "Bright yellow variant"
-   Yellow Muted: "Strings, muted yellow"

#### Diagnostic Colors

-   Error: "Errors, deletions"
-   Warning: "Warnings"
-   Warning Alt: "Editor warnings"
-   Info: "Information messages"
-   Hint: "Hints, suggestions"

#### Git Colors

-   Modified: "Modified files/lines"
-   Added: "Added files/lines"
-   Deleted: "Deleted files/lines"
-   Untracked: "Untracked files"
-   Ignored: "Ignored files"

### Sources Section

Always include at the end:

```markdown
## Sources

-   [Night Owl Gogh Terminal Theme](https://github.com/Gogh-Co/Gogh/blob/master/themes/Night%20Owl.yml)
-   [Night Owl VS Code Theme](https://github.com/sdras/night-owl-vscode-theme)
```

## Step-by-Step Regeneration Workflow

Follow these steps to regenerate the theme files:

### Step 1: Fetch Source Data

1. Download the Gogh YAML file from the Gogh repository
2. Download the VS Code JSON file from the night-owl-vscode-theme repository
3. Parse both files into usable data structures

### Step 2: Extract and Organize Colors

1. Extract core colors (background, foreground, cursor) from Gogh YAML
2. Extract all 16 ANSI colors from Gogh YAML (color_01 through color_16)
3. Extract syntax colors from VS Code JSON tokenColors array
4. Extract UI colors from VS Code JSON colors object
5. Identify and extract accent colors that appear frequently
6. Extract diagnostic colors (error, warning, info)
7. Extract diff colors (inserted, removed backgrounds)
8. Extract git gutter colors (modified, added, deleted)

### Step 3: Generate colors.json

1. Create the hierarchical JSON structure with 8 main sections
2. Populate each section with extracted colors using the field mappings above
3. Ensure all hex values are lowercase
4. Preserve alpha channels where they exist
5. Validate JSON syntax
6. Write to `colors.json`

### Step 4: Generate README.md

1. Create the markdown header with title and description
2. Build each section's table with color badges, hex codes, and usage descriptions
3. Use the via.placeholder.com URL format for color previews
4. Ensure consistent formatting across all tables
5. Add the sources section at the end
6. Write to `README.md`

### Step 5: Validation

1. Verify colors.json is valid JSON
2. Check that all expected colors are present
3. Verify README.md renders correctly in markdown viewers
4. Confirm color preview badges display properly
5. Check that hex codes match between files

## Example Mappings

Here are concrete examples of how to map colors from sources to outputs:

### Example 1: ANSI Colors

**Source (Gogh YAML):**

```yaml
color_02: "#EF5350" # Red (Syntax string)
color_10: "#EF5350" # Bright Red (Command error)
```

**Output (colors.json):**

```json
{
    "ansi": {
        "normal": {
            "red": "#ef5350"
        },
        "bright": {
            "red": "#ef5350"
        }
    }
}
```

**Output (README.md):**

```markdown
| ![#ef5350](https://via.placeholder.com/15/ef5350/ef5350.png) Red | `#ef5350` | Terminal red (errors, strings) |
| ![#ef5350](https://via.placeholder.com/15/ef5350/ef5350.png) Bright Red | `#ef5350` | Terminal bright red (errors) |
```

### Example 2: Syntax Colors

**Source (VS Code JSON):**

```json
{
    "tokenColors": [
        {
            "scope": ["keyword", "storage.type", "storage.modifier"],
            "settings": {
                "foreground": "#c792ea"
            }
        }
    ]
}
```

**Output (colors.json):**

```json
{
    "syntax": {
        "keyword": "#c792ea"
    }
}
```

**Output (README.md):**

```markdown
| ![#c792ea](https://via.placeholder.com/15/c792ea/c792ea.png) Keyword | `#c792ea` | Keywords, operators, storage types |
```

### Example 3: UI Colors

**Source (VS Code JSON):**

```json
{
    "colors": {
        "editor.background": "#011627",
        "editor.selectionBackground": "#1d3b53"
    }
}
```

**Output (colors.json):**

```json
{
    "ui": {
        "editor": {
            "background": "#011627",
            "selection": "#1d3b53"
        }
    }
}
```

**Output (README.md):**

```markdown
| ![#1d3b53](https://via.placeholder.com/15/1d3b53/1d3b53.png) Selection | `#1d3b53` | Text selection |
```

## Backward Compatibility Notes

-   Maintain the existing JSON structure to avoid breaking dependent configurations
-   If new colors are added to upstream themes, add them to appropriate sections
-   If colors are renamed upstream, keep both old and new names for one version
-   Document any breaking changes in a CHANGELOG or comments
-   Preserve the exact order of sections in both files
-   Keep alpha channel values when present (don't convert to solid colors)

## Maintenance Schedule

Suggested update frequency:

-   Check for upstream updates: Monthly
-   Regenerate files: When significant changes detected
-   Version the files if making breaking changes
-   Test generated files with actual configurations before committing

## Notes for AI Agents

-   Always fetch the latest versions from the raw GitHub URLs
-   Parse YAML carefully, respecting indentation and comments
-   Handle both simple hex values and hex values with alpha channels
-   Some VS Code theme colors may be `null` - skip these or use fallbacks
-   Maintain consistent casing (lowercase hex, camelCase properties)
-   Validate output files before saving
-   Report any colors that couldn't be mapped from sources
-   If source structure changes significantly, document the changes needed in this file
