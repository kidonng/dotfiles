function _tide_item_shlvl
    set -q tide_shlvl_color || set -l tide_shlvl_color yellow
    set -q tide_shlvl_icon || set -l tide_shlvl_icon 
    set -q tide_shlvl_threshold || set -l tide_shlvl_threshold 1

    # Note tide show items in subshells
    set -l shlvl (math $SHLVL - 1)
    set -l space
    test "$TERM_PROGRAM" = vscode && set space " "

    if test $shlvl -gt $tide_shlvl_threshold
        set_color $tide_shlvl_color
        printf '%s' $tide_shlvl_icon' ' $shlvl"$space"
    end
end
