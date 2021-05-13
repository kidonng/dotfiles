# Based on $__fish_data_dir/functions/fish_title.fish
function fish_title
    set -q argv[1] && echo "$argv · "
    string replace $HOME "~" $PWD
end
