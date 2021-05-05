# https://github.com/fish-shell/fish-shell/issues/7966
if string match -q "LibreSSL*" (openssl version)
    complete -c openssl -n __fish_use_subcommand -x -a "(openssl help 2>&1 | tail -n +2 | string match -rv '^[A-Z]|^\$' | string split -n ' ')"
else
    source $__fish_data_dir/completions/openssl.fish
end
