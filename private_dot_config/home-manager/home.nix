{ pkgs, ... }:

{
  home.username = "kid";
  home.homeDirectory = "/Users/kid";

  home.sessionVariables = {
    SHELL = "$HOME/.nix-profile/bin/fish";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
    "/Applications/mpv.app/Contents/MacOS"
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      set --local packages \
        ~/.nix-profile \
        /opt/homebrew \
        (string match '/nix/store/*' $PATH | path dirname)
      set --append fish_complete_path $packages/share/fish/vendor_completions.d
      set --append fish_function_path $packages/share/fish/vendor_functions.d

      set fish_greeting
    '';
    shellAbbrs = {
      c = "nvim -m";
      v = "nvim";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = ''
      require("config.lazy")
    '';
    extraPackages = [
      pkgs.fd
      pkgs.imagemagick
      pkgs.nodejs
      pkgs.ripgrep
    ];
  };

  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.zoxide.enable = true;

  programs.broot = {
    enable = true;
    settings = {
      icon_theme = "nerdfont";
      special_paths = {
        "~/.config" = { "show" = "always"; };
        "~/OrbStack" = { "list" = "never"; };
      };
    };
  };

  home.packages = [
    pkgs.chezmoi
    pkgs.fzf
    pkgs.ghq
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
