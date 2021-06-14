function _tide_item_node
    if test -e package.json
        set_color $tide_nvm_color
        printf '%s' $tide_nvm_icon' ' (node --version)
    end
end
