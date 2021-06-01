function preview -d "Preview file contents"
    for arg in $argv
        set -q multi && echo

        test (count $argv) != 1 && echo (set_color -o)$arg(set_color normal)
        __fzf_preview_file $arg

        set -l multi
    end
end
