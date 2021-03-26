# Based on https://github.com/junegunn/fzf/issues/1598#issuecomment-719573480
function rzf
    argparse -i e/editor -- $argv

    set selection (rg --color=always --line-number --smart-case "$argv" |
    fzf --ansi --delimiter : \
        --with-nth=1,3 \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --preview-window +{2}-/2)

    test -z "$selection" && return

    if set -q _flag_editor
        string split -f 1,2 : $selection | read -z file line
        $EDITOR +$line $file
        return
    end

    set selection (string split -f 1 : $selection)
    if status is-command-substitution
        echo $selection
    else
        commandline --current-token --replace -- (string escape -- $selection | string join ' ')
    end
end
