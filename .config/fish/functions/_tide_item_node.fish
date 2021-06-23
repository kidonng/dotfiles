function _tide_item_node
    if test -f package.json || test (count *.{{,c,m}j,t}s) != 0
        set_color $tide_nvm_color
        printf '%s' $tide_nvm_icon' ' (node --version)
    end
end
