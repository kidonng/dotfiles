set -Ux EDITOR nvim
set -Ux LESS --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT

# https://github.com/franciscolourenco/done/pull/108
set -U __done_exclude "git (?!push|pull|fetch)"
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -U fzf_fish_custom_keybindings
set -U fzf_preview_file_cmd __fzf_preview_file_content
set -U fzf_preview_dir_cmd exa --icons
# ALL_PROXY: curl, Homebrew, etc.
# HTTPS_PROXY: Deno
set -U proxy_vars ALL_PROXY HTTPS_PROXY

