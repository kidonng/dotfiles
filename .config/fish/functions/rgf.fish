# Based on https://github.com/junegunn/fzf/issues/1598#issuecomment-719573480
function rgf -d "ripgrep piped into fzf" -w rg
    test -z "$argv" && set argv ""
    set selection (rg --color=always --line-number $argv |
    fzf --ansi --delimiter : \
        --with-nth=1,3 \
        --preview 'bat --style=header,numbers --color=always --highlight-line {2} {1}' \
        --preview-window ~1:+{2}-/2)

    test -z "$selection" && return

    set selection (string split -f 1 : $selection)
    if status is-command-substitution
        echo $selection
    else
        commandline --current-token --replace -- (string escape -- $selection | string join ' ')
    end
end
