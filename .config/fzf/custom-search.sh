#!/bin/sh

FZF_MAIN_SEARCH_PATHS='~/Documents/ ~/.config/'
FZF_ADDITION_FILES=(~/.zshrc ~/.tmux.conf)

(fd . $(eval echo $FZF_MAIN_SEARCH_PATHS) --type f --type d --exclude node_modules/ && for path in "${FZF_ADDITION_FILES[@]}"; do echo "$path"; done) | fzf | xargs -r lvim