command -sq grc || exit

function (string replace .fish "" (status basename))
    grc (status current-command) $argv
end
