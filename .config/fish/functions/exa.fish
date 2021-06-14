command -sq exa || exit

function exa
    command exa --group-directories-first --git $argv
end
