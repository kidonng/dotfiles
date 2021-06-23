function _tide_item_private
    set -q tide_private_color || set -l tide_private_color white
    set -q tide_private_icon || set -l tide_private_icon 

    if test -n "$fish_private_mode"
        set_color $tide_private_color
        printf '%s' $tide_private_icon' '
    end
end
