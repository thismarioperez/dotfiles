#!/usr/bin/env bash

# heavily inspired by: https://github.com/kylepeeler/tmux-nightowl

# source and run theme

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

$current_dir/scripts/main.sh
