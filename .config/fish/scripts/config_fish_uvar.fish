set -Ux EDITOR code -w
set -Ux HOMEBREW_FORCE_BREWED_CURL 1

set -Ux LESS -R -i -M
set -Ux LESS_TERMCAP_md (set_color -o)(set_color blue)
set -Ux LESS_TERMCAP_us (set_color -u)(set_color green)
set -Ux LESS_TERMCAP_ue (set_color normal)

# Usage: https://github.com/fish-shell/fish-shell/pull/4940
# stderr-nocaret: enabled in https://github.com/fish-shell/fish-shell/pull/7907
# qmakr-noglob: I don't use it and it doesn't seem to break something
set -U fish_features stderr-nocaret qmark-noglob
set -U fish_greeting

set -U fzf_preview_file_cmd preview
set -U fzf_preview_dir_cmd exa --icons

# ALL_PROXY: curl, Homebrew, etc.
# HTTPS_PROXY: Deno
set -U proxy_vars ALL_PROXY HTTPS_PROXY
