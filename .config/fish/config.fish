set -l plug $plug_path/kidonng/plug.fish/functions/plug.fish
test -f $plug && source $plug && plug init

status -i || exit

command -sq fzf && bind \ef "PAGER='fzf -m' __fish_paginate"

if command -sq zoxide
    function __zoxide_hook -v PWD
        zoxide add $PWD
    end
end

if functions -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf --history=\e\cr
    bind \cr _fzf_search_history_no_timestamp
    bind \e\cf _fzf_search_directory_all
end
