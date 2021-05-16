complete z -f -a '(complete -C "/42 "(commandline -t) | string match -r \'.*/$\')'
complete z -n "test -n (commandline -t)" -a "(zoxide query -l -- (commandline -t))" -k
