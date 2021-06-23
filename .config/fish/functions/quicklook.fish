command -sq qlmanage || exit

function quicklook
    qlmanage -p $argv &>/dev/null
end
