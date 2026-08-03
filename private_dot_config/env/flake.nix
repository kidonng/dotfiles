{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/0.1";
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
  };

  outputs = { nixpkgs, nixpkgs-unstable, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "env";
        paths = with pkgs; [
          # TODO: switch to pkgs.atuin when 18.18 is available
          pkgs-unstable.atuin
          broot
          chezmoi
          fish
          fd
          fzf
          ghq
          imagemagick
          neovim
          nodejs
          ripgrep
          zoxide
        ];
      };
    };
}
