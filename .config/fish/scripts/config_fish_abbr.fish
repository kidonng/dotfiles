# Fish functions
abbr dot dotfiles
abbr ql quicklook
abbr rm trash
abbr sha sha256sum

# Common
abbr df df -h
abbr di diff
abbr du du -hcs
abbr tmp mktemp
abbr tmpd mktemp -d
abbr tmpsh "HOME=(mktemp -d) fish -C cd"

# macOS
abbr cafe caffeinate
abbr cap screencapture
abbr ipc ipconfig getpacket en0
abbr mfd mdfind
abbr op open
abbr pbc pbcopy
abbr pbp pbpaste

abbr dls diskutil list
abbr dmo sudo diskutil mount
abbr dum diskutil unmount

# Extra
abbr cat bat -p
abbr rat bat -l ruby
abbr batman 'MANPAGER="col -bx | bat -l man -p" man'

abbr md glow -p
abbr vi nvim

abbr bbc brew bundle --global cleanup
abbr bbd brew bundle --global dump
abbr bca brew cat
abbr bcl brew cleanup
abbr bin brew install
abbr bls brew list
abbr bout brew outdated
abbr br brew
abbr brm brew uninstall
abbr bup brew update
abbr bupg brew upgrade

abbr dl curl -LOR -C -
abbr get curl -L
abbr ip4 curl -sS4 ip.sb
abbr ip6 curl -sS6 ip.sb

abbr ls exa
abbr la exa -a
abbr ll exa -l

# Git
# Derived from https://github.com/fish-shell/fish-shell/blob/9f4255ed76683d6772f354c1fb818a1655e877a0/share/completions/git.fish#L582-L604
git config --global -z --get-regexp "alias\..*" | while read -lz alias command
    string match -q "!*" -- $command && continue

    set -l alias (string replace 'alias.' '' -- $alias)

    abbr g$alias git $command
end

abbr ga git add
abbr grm git rm

# for command in F Q Qd Qdt Qe Qg Qi Ql Qm Qn Qo Qs Qt Qu Sg Si Sl Ss
#     abbr $command pacman -$command
# end

# for command in D Fy Qk Qkk R Rs Rsn S Sc Scc Sw Syu U
#     abbr $command sudo pacman -$command
# end

