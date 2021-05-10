set -Ux EDITOR nvim
set -Ux LESS --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT

# https://github.com/franciscolourenco/done/pull/108
set -U __done_exclude "git (?!push|pull|fetch)"
set -U fish_greeting
set -U fzf_preview_dir_cmd exa
# ALL_PROXY: curl, Homebrew, etc.
# HTTPS_PROXY: Deno
set -U proxy_vars ALL_PROXY HTTPS_PROXY

