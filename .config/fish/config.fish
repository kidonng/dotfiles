set -a fish_function_path $__fish_user_data_dir/plug/kidonng/fish-plug/functions
functions -q plug && plug init

status -i || exit

fish_add_path -g ~/.cargo/bin /usr/local/sbin

functions -q set_proxy && set_proxy > /dev/null

command -sq fzf && set -x FZF_DEFAULT_OPTS --cycle --layout=reverse --height=90% --preview-window=wrap --multi
command -sq less && set -x LESS --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT
command -sq nvim && set -x EDITOR nvim
command -sq starship && starship init fish --print-full-init | source
command -sq zoxide && zoxide init fish --no-aliases | source

