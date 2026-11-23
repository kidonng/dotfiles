# Ensure correct shell, e.g. in VSCode
set --export SHELL (status fish-path)
command --query nvim && set --export EDITOR nvim

# omp Google Vertex
set --export GOOGLE_CLOUD_PROJECT project-20f98745-b415-458b-9d4
set --export GOOGLE_CLOUD_LOCATION global

# Enable image support in Neovim
# iTerm's Unicode placeholder part of kitty image protocol is buggy
# WezTerm is chosen as it does not use placeholder
# https://github.com/folke/snacks.nvim/blob/882c996cf28183f4d63640de0b4c02ec886d01f2/lua/snacks/image/terminal.lua#L20-L25
set --export SNACKS_WEZTERM 1

fish_add_path --global ~/.local/bin \
    /Applications/mpv.app/Contents/MacOS

status is-interactive || exit

set fish_greeting

command --query omp && abbr o omp
command --query nvim && abbr v nvim

command --query atuin && atuin init fish | source
command --query zoxide && zoxide init fish | source
