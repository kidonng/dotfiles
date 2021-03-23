set -l fd ~/.config/fd/
test -e $fd || mkdir -p $fd
ln -s ~/.config/git/ignore $fd
