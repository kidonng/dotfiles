# Based on https://github.com/junegunn/fzf/issues/1598#issuecomment-719573480
function rgf -d "ripgrep love fzf" -w rg
    set -q argv[1] || set argv ""
    set selection (rg --color always -n $argv |
    fzf --ansi -m -d : \
        --with-nth 1,3 \
        --preview 'bat --style header,numbers --color always --highlight-line {2} {1}' \
        --preview-window ~1:+{2}-/2 |
    string split -f 1 :)

    set -q selection[1] || return

    if status is-command-substitution
        echo $selection
    else
        commandline -i -- (string escape -- $selection | string join ' ')
    end
end
