contains $NIX_PROFILES/bin $PATH || set -p PATH $NIX_PROFILES/bin

set -l plug $plug_path/kidonng/plug.fish/functions/plug.fish
test -f $plug && source $plug && plug init

status -i || exit

#command -sq fzf && bind \ef 'PAGER="fzf -m" __fish_paginate'
#bind \e\[47\;9u __fish_toggle_comment_commandline

set -q fish_private_mode && set -x fish_private_mode $fish_private_mode

if command -sq zoxide
    function __zoxide_hook -v PWD
        zoxide add $PWD
    end
end
