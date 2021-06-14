functions -q _fzf_search_history || exit

function _fzf_search_history_no_timestamp
    set -x fzf_history_opts --with-nth 4..

    _fzf_search_history
end
