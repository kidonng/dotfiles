function fzf_configure_bindings
    bind \cf _fzf_search_directory
    bind \e\cf 'fzf_fd_opts=-H fzf_preview_dir_cmd="exa -a" _fzf_search_directory'

    bind \cr 'fzf_history_opts=--with-nth=4.. _fzf_search_history'
    bind \e\cr _fzf_search_history

    bind \cv $_fzf_search_vars_command
    bind \e\cl _fzf_search_git_log
    bind \e\cs _fzf_search_git_status

    bind \el 'fzf_fd_opts=--exact-depth=1 _fzf_search_directory'
end
