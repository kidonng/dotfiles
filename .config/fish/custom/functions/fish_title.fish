# Based on $__fish_data_dir/functions/fish_title.fish
function fish_title
    if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        set command (set -q argv[1] && echo $argv[1] || status current-command)
        test "$command" = fish || echo "$command - "
        string replace $HOME "~" (__fish_pwd)

        if set -q previous_columns; and test "$previous_columns" != $COLUMNS || test "$previous_lines" != $LINES
            echo " $COLUMNS×$LINES"
        end
        set -g previous_columns $COLUMNS
        set -g previous_lines $LINES
    end
end
