function abbr-nix-shell
    echo $argv |
        string replace 's#' 'nix shell nixpkgs#' |
        string replace --all , ' nixpkgs#'
    # Don't fail
    return 0
end
