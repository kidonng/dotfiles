command -sq rg || exit

function rg
    command rg --smart-case $argv
end
