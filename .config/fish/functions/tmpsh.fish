function tmpsh -w fish
    set -lx HOME (mktemp -d)

    fish -C "
        function __tmpsh_cleanup -e fish_exit
            echo (set_color -o)Cleaning up...(set_color normal)
            rm -rf ~
        end

        cd
    " $argv
end
