functions -q __fzf_search_current_dir || exit

function __fzf_search_current_dir_all
    set -x fzf_fd_opts --hidden
    set -lx fzf_preview_dir_cmd exa -a
    __fzf_search_current_dir
end
