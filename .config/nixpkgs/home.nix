{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.bat
    pkgs.curl
    pkgs.delta
    pkgs.deno
    pkgs.du-dust
    pkgs.exa
    pkgs.fd
    pkgs.fish
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.glow
    pkgs.go
    pkgs.grc
    pkgs.less
    pkgs.nixpkgs-fmt
    pkgs.nodejs
    pkgs.p7zip
    pkgs.ripgrep
    pkgs.rustc
    pkgs.timg
    pkgs.vivid
    pkgs.yarn
    pkgs.youtube-dl
    pkgs.zoxide
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kid";
  home.homeDirectory = "/Users/kid";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
