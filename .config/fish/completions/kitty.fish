# Default kitty completion has annoying `-f`
complete kitty -a "(commandline -cop | kitty +complete fish)"
