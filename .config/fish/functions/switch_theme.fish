function switch_theme
    set -l dark

    if test "$theme" = light
        set -U theme dark
        set dark true
    else
        set -U theme light
        set dark false
    end

    command -sq bat && set -Ux BAT_THEME TokyoNight-$theme
    command -sq vivid && set -Ux LS_COLORS (vivid generate TokyoNight-$theme)

    if command -sq fzf
        set -l fzf_opt --color=$theme,gutter:-1

        if set index (contains -i -- (string match -- "--color*" $FZF_DEFAULT_OPTS) $FZF_DEFAULT_OPTS)
            set FZF_DEFAULT_OPTS[$index] $fzf_opt
        else
            set -a FZF_DEFAULT_OPTS $fzf_opt
        end
    end

    ln -sf ~/.config/git/config.theme{.$theme,}

    if command -sq kitty
        ln -sf ~/.config/kitty/{TokyoNight-$theme,theme}.conf
        kitty @set-colors -a -c ~/.config/kitty/theme.conf
    end

    test (uname) = Darwin && osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to '$dark
end
