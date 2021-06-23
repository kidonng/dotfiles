function fzf_configure_bindings
    bind \cf _fzf_search_directory
    bind \e\cf _fzf_search_directory_all

    bind \cr _fzf_search_history_no_timestamp
    bind \e\cr _fzf_search_history

    bind \cv $_fzf_search_vars_command
    bind \e\cl _fzf_search_git_log
    bind \e\cs _fzf_search_git_status
end
