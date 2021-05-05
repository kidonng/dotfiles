if test "$EDITOR" = nvim
    test -z "$XDG_DATA_HOME" && set -l XDG_DATA_HOME ~/.local/share
    set dir $XDG_DATA_HOME/nvim/site
else
    set dir ~/.vim/autoload
end

curl https://github.com/junegunn/vim-plug/raw/master/plug.vim --create-dirs -sSLo $dir/autoload/plug.vim
