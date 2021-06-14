functions -q _fzf_search_directory || exit

function _fzf_search_directory_all
    set -x fzf_fd_opts --hidden
    set -lxa fzf_preview_dir_cmd -a

    _fzf_search_directory
end
