command -sq nix || exit

function nrun
    set -l opts
    set -l pkgs $argv[1]
    set -l args $argv

    if set -l sep (contains -i -- -- $argv)
        set -l index (math $sep - 1)
        set opts (string match -- "-*" $argv[..$index])
        set pkgs (string match -v -- "-*" $argv[..$index])
        set args $argv[(math $sep + 1)..]
    end

    nix run $opts nixpkgs.$pkgs -c $args
end
