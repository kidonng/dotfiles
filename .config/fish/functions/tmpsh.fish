function tmpsh -w fish
    set -lx HOME (mktemp -d)

    fish -C "
        function __tmpsh_cleanup -e fish_exit
            rm -rf ~
        end

        cd
    " $argv
end
