abbr dot dotfiles
abbr ql quicklook
abbr rm trash
abbr sha sha256sum

abbr df df -h
abbr di diff
abbr du du -hs
abbr tmp mktemp -d

abbr cafe caffeinate
abbr cap screencapture
abbr ipc ipconfig getpacket en0
abbr ldd otool -L
abbr mfd mdfind
abbr op open
abbr pbc pbcopy
abbr pbp pbpaste

abbr dls diskutil list
abbr dmo sudo diskutil mount
abbr dum diskutil unmount

abbr hm home-manager
abbr ncg nix-collect-garbage
abbr nch nix-channel
abbr ne nix-env
abbr nr nix run
abbr ns nix-shell

abbr cat bat -p
abbr co code
abbr icat kitty +icat
abbr md glow -p
abbr yt youtube-dl

abbr dl curl -LOR -C -
abbr get curl -L
abbr ip4 curl -sS4 ip.sb
abbr ip6 curl -sS6 ip.sb

abbr ls exa
abbr la exa -a
abbr ll exa -l

# https://github.com/fish-shell/fish-shell/blob/9f4255ed76683d6772f354c1fb818a1655e877a0/share/completions/git.fish#L582-L604
git config --global --get-regexp "alias\..*" | string replace alias. "" | while read -l alias command
    abbr g$alias git $command
end

abbr ga git add
abbr grm git rm
