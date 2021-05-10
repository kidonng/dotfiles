test -z "$XDG_DATA_HOME" && set -l XDG_DATA_HOME ~/.local/share

git clone --depth 1 https://github.com/wbthomason/packer.nvim $XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim
