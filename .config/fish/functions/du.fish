function du
    test (count (string match -v -- "-*" $argv)) -gt 1 && set -p argv -c

    if command -sq grc
        grc du $argv
    else
        command du $argv
    end
end
