function switch_theme
    if test "$THEME" = light
        set -Ux THEME dark
    else
        set -Ux THEME light
    end

    set -Ux FZF_DEFAULT_OPTS --cycle --reverse --height 90% --preview-window wrap --color $THEME,gutter:-1
    set -Ux LS_COLORS (vivid generate TokyoNight-$THEME)

    ln -sf ~/.config/kitty/{TokyoNight-$THEME,theme}.conf
    ln -sf ~/.config/git/config.theme{.$THEME,}

    kitty @set-colors -a -c ~/.config/kitty/theme.conf
end
