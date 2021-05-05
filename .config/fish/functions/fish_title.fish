# Based on $__fish_data_dir/functions/fish_title.fish
function fish_title
    if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        set command (set -q argv[1] && echo $argv[1] || status current-command)
        if test "$command" = fish
            string replace $HOME "~" (__fish_pwd)
        else
            echo $command
        end
    end
end
