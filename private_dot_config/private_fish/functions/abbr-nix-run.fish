function abbr-nix-run
    echo $argv -- |
        string replace 'r#' 'nix run nixpkgs#'
    # Don't fail
    return 0
end
