set --local nixDaemon /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
test -e $nixDaemon && source $nixDaemon

set --local nix ~/.nix-profile
set --local brew /opt/homebrew

fish_add_path --global --move \
    ~/.local/bin \
    {$nix,$brew}/bin \
    /Applications/mpv.app/Contents/MacOS

set --export EDITOR nvim
set --export SHELL (command --search fish)

set --append fish_complete_path {$nix,$brew}/share/fish/vendor_completions.d
set --append fish_function_path {$nix,$brew}/share/fish/vendor_functions.d

status is-interactive || exit

set fish_greeting

atuin init fish --disable-up-arrow | source
zoxide init fish | source

abbr c nvim -m
abbr v nvim
