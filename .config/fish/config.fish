set -a fish_function_path $__fish_user_data_dir/plug/kidonng/plug.fish/functions
functions -q plug && plug init

status -i || exit

if command -sq zoxide
    function __zoxide_hook --on-variable PWD
        zoxide add $PWD
    end
end

if set -q fzf_search_vars_cmd
    bind -M insert \cf __fzf_search_current_dir
    bind -M insert \cr __fzf_search_history_no_timestamp
    bind -M insert \cv $fzf_search_vars_cmd
    bind -M insert \e\cl __fzf_search_git_log
    bind -M insert \e\cs __fzf_search_git_status
    bind -M insert \e\cf __fzf_search_current_dir_all
    bind -M insert \e\cr __fzf_search_history
end

# https://github.com/nickeb96/puffer-fish/pull/5
if functions -q puffer_fish_key_bindings_uninstall
    bind -e . !
end
