function switch_theme
    if test "$theme" = light
        set -U theme dark
    else
        set -U theme light
    end

    set -Ux BAT_THEME TokyoNight-$theme
    set -Ux FZF_DEFAULT_OPTS --cycle --reverse --preview-window wrap --color $theme,gutter:-1
    set -Ux LS_COLORS (vivid generate TokyoNight-$theme)

    ln -sf ~/.config/git/config.theme{.$theme,}
    ln -sf ~/.config/kitty/{TokyoNight-$theme,theme}.conf

    kitty @set-colors -a -c ~/.config/kitty/theme.conf
end
