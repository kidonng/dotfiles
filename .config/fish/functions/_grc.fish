command -sq grc || exit

set -l cmd (string replace .fish "" (status basename))

function $cmd -V cmd
    grc $cmd $argv
end
