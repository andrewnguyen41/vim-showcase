#!/bin/bash

# Define the main search paths
FZF_MAIN_SEARCH_PATHS=("$HOME/Work/" "$HOME/Downloads/" "$HOME/dotfiles/.config/"  "$HOME/dotfiles/.tmux/")

# Define additional individual files
FZF_ADDITION_FILES=("$HOME/dotfiles/.zshrc" "$HOME/dotfiles/.tmux.conf")

# Define paths to exclude
FZF_EXCLUDE_PATHS=('node_modules')

# Command to search using 'fd'
FD_CMD=(fd . --type f --type d)

# Add search paths to the fd command
for path in "${FZF_MAIN_SEARCH_PATHS[@]}"; do
    FD_CMD+=("$path")
done

# Add exclude paths to the fd command
for exclude in "${FZF_EXCLUDE_PATHS[@]}"; do
    FD_CMD+=(--exclude "$exclude")
done

# Execute the fd command and add additional files
# Then pipe the result to fzf and open the selected file with lvim
("${FD_CMD[@]}" && printf '%s\n' "${FZF_ADDITION_FILES[@]}") | fzf | xargs -r lvim
