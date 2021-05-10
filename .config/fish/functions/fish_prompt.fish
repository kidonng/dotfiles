command -sq starship || exit

set -x STARSHIP_SESSION_KEY (random 10000000000000 9999999999999999)
set -x STARSHIP_SHELL fish

function fish_prompt
    switch $fish_key_bindings
        case fish_hybrid_key_bindings fish_vi_key_bindings
            set STARSHIP_KEYMAP $fish_bind_mode
        case \*
            set STARSHIP_KEYMAP insert
    end

    starship prompt -d $CMD_DURATION -k $STARSHIP_KEYMAP -s $status -j (jobs | count)
end
