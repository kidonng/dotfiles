functions -q __fzf_search_history || exit

function __fzf_search_history_no_timestamp
    set -x fzf_history_opts --with-nth 4..
    __fzf_search_history
end
