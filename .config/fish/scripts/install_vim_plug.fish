set -l vim_plug https://github.com/junegunn/vim-plug/raw/master/plug.vim

if test "$EDITOR" = nvim
    if test -z "$XDG_DATA_HOME"
        set XDG_DATA_HOME ~/.local/share
    end

    command curl $vim_plug --create-dirs -sSLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim
else
    command curl $vim_plug --create-dirs -sSLo ~/.vim/autoload/plug.vim
end
