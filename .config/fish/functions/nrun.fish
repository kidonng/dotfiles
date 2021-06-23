command -sq nix || exit

function nrun -a pkg
    nix run nixpkgs.$pkg -c $pkg $argv[2..]
end
