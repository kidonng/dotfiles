fish_add_path --global \
    ~/.local/bin \
    /opt/homebrew/bin

set --export EDITOR nvim
set --export SHELL /opt/homebrew/bin/fish

status is-interactive || exit

set fish_greeting

atuin init fish --disable-up-arrow | source
zoxide init fish | source

abbr c nvim -m
abbr v nvim
