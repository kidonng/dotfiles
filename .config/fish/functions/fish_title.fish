function fish_title
    # https://github.com/IlanCosman/tide/issues/164
    if set -q _tide_left_prompt_display_var && ! set -q $_tide_left_prompt_display_var
        return
    end

    if set -q argv[1]
        echo $argv
        return
    end

    switch $PWD
        case $HOME
            echo "~"
        case /
            echo /
        case "*"
            set -l sections (string split / $PWD)
            set -l current $sections[-1]

            while test (count $sections) != 1
                for marker in (string join / $sections)/$tide_pwd_markers
                    if test -e $marker
                        echo $sections[-1]
                        return
                    end
                end

                set -e sections[-1]
            end

            echo $current
    end
end
