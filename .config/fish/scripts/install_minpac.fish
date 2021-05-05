if test "$EDITOR" = nvim
    test -z "$XDG_CONFIG_HOME" && set -l XDG_DATA_HOME ~/.config
    set dir $XDG_DATA_HOME/nvim
else
    set dir ~/.vim
end

git clone --depth 1 https://github.com/k-takata/minpac $dir/pack/minpac/opt/minpac
