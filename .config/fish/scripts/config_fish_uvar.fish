set -Ux EDITOR code -w
set -Ux FZF_DEFAULT_OPTS --cycle --reverse --preview-window wrap

set -Ux LESS -R -i -M --incsearch
set -Ux LESS_TERMCAP_md (set_color -o)(set_color blue)
set -Ux LESS_TERMCAP_us (set_color -u)(set_color green)
set -Ux LESS_TERMCAP_ue (set_color normal)

set -Ux NIX_PATH ~/.nix-defexpr/channels
set -Ux NIX_PROFILES ~/.nix-profile
set -Ux NIX_SSL_CERT_FILE ~/.nix-profile/etc/ssl/certs/ca-bundle.crt

# Usage: https://github.com/fish-shell/fish-shell/pull/4940
# stderr-nocaret: enabled in https://github.com/fish-shell/fish-shell/pull/7907
# qmark-noglob: never used it and doesn't seem to break anything
set -U fish_features stderr-nocaret qmark-noglob
set -U fish_greeting

set -U fzf_preview_file_cmd preview
set -U fzf_preview_dir_cmd exa

# ALL_PROXY: curl
# HTTPS_PROXY: Deno
# set -U proxy_vars ALL_PROXY HTTPS_PROXY
