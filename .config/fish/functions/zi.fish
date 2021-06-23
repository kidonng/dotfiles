if ! command -sq zoxide || ! command -sq fzf
    exit
end

function zi
    set dir (zoxide query -i -- $argv) && cd $dir
end
