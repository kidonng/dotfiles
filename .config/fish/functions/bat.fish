command -sq bat || exit

function bat
    # $XDG_CONFIG_HOME/git
    # https://github.com/sharkdp/bat/blob/bef0bf16542c9e4ac20dae9153e75eeb402b3bc0/src/syntax_mapping.rs#L114-L115
    set -x XDG_CONFIG_HOME ~/.config

    command bat --italic-text always $argv
end
