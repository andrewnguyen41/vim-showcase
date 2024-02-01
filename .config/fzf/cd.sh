#!/bin/bash

# Set the search paths
FZF_MAIN_SEARCH_PATHS="~/Work/ ~/Downloads/ ~/.config/"

# Run fd and fzf to interactively select a directory
selected_dir=$(fd . $(eval echo $FZF_MAIN_SEARCH_PATHS) --type d --exclude node_modules/ | fzf)

# Check if a directory was selected
if [ -n "$selected_dir" ]; then
    # Change the current directory (quoting to handle spaces)
    cd "$selected_dir"
fi
