# Fish functions
abbr bcat brew_cat
abbr dot dotfiles
abbr rm trash

# Common
abbr df df -h
abbr di diff
abbr du du -hcs
abbr tmp mktemp
abbr tmpd mktemp -d
abbr tmpsh "HOME=(mktemp -d) fish"
abbr sha shasum -a 256

# macOS
abbr cafe caffeinate
abbr cap screencapture
abbr ipc ipconfig getpacket en0
abbr mfd mdfind
abbr op open
abbr pcp pbcopy
abbr pps pbpaste

abbr dls diskutil list
abbr dmo sudo diskutil mount
abbr dum diskutil unmount

# Extra
abbr cat bat -p
abbr batman 'MANPAGER="col -bx | bat -l man -p" man'

abbr co code
abbr hex hexyl
abbr md glow -p
abbr ps procs
abbr vi nvim

abbr bbc brew bundle --global cleanup
abbr bbd brew bundle --global dump
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

for type in json yaml toml xml csv
    set -l abbr (string sub -l 1 $type)q
    abbr $abbr dasel select -p $type
end

abbr ls exa
abbr la exa -a
abbr ll exa -l --icons

# Git
# Derived from https://github.com/fish-shell/fish-shell/blob/9f4255ed76683d6772f354c1fb818a1655e877a0/share/completions/git.fish#L582-L604
command git config --global -z --get-regexp "alias\..*" | while read -lz alias command
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

