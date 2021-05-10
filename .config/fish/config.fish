set -a fish_function_path $__fish_user_data_dir/plug/kidonng/plug.fish/functions
functions -q plug && plug init

status -i || exit

fish_add_path -g ~/.cargo/bin /usr/local/sbin

functions -q set_proxy && set_proxy > /dev/null

command -sq less && set -x LESS --RAW-CONTROL-CHARS --ignore-case --LONG-PROMPT
command -sq nvim && set -x EDITOR nvim
command -sq zoxide && zoxide init fish --no-aliases | source

functions -q __fzf_search_current_dir && bind \e\cf __fzf_search_current_dir_all

if functions -q __fzf_search_history
    bind \cr __fzf_search_history_no_timestamp
    bind \e\cr __fzf_search_history
end
