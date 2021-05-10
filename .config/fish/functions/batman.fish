function batman -w man
    set -lx MANPAGER "col -bx | bat --theme TokyoNight-$THEME -l man -p"
    man $argv
end
