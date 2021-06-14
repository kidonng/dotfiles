# Based on $__fish_data_dir/functions/fish_title.fish
function fish_title
    if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        set -q argv[1] && echo "$argv · "
        string replace $HOME "~" (__fish_pwd)
    end
end
