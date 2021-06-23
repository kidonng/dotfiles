function _tide_item_nix_shell
    set -q tide_nix_color || set -l tide_nix_color blue
    set -q tide_nix_icon || set -l tide_nix_icon 

    if set -q IN_NIX_SHELL
        set_color $tide_nix_color
        printf '%s' $tide_nix_icon' ' $IN_NIX_SHELL
    end
end
