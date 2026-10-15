{ pkgs, ... }:

{
  home.username = "kid";
  home.homeDirectory = "/Users/kid";

  home.sessionVariables = {
    # omp web search
    FIRECRAWL_BASE_URL = "http://oracle-sjc:3002";
    FIRECRAWL_API_KEY = "stub";
    # omp Google Vertex
    GOOGLE_CLOUD_PROJECT = "project-20f98745-b415-458b-9d4";
    GOOGLE_CLOUD_LOCATION = "global";
    # Ensure correct shell, e.g. in VSCode
    SHELL = "$HOME/.nix-profile/bin/fish";
    # Enable image support in Neovim
    # iTerm's Unicode placeholder part of kitty image protocol is buggy
    # WezTerm is chosen as it does not use placeholder
    # https://github.com/folke/snacks.nvim/blob/882c996cf28183f4d63640de0b4c02ec886d01f2/lua/snacks/image/terminal.lua#L20-L25
    SNACKS_WEZTERM = "1";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "/Applications/mpv.app/Contents/MacOS"
    "/Applications/Tern.app/Contents/MacOS"
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      set --local roots \
        # It is how it is
        (string split ' ' $NIX_PROFILES) \
        /opt/homebrew \
        # Dynamic paths from nix shell
        (string match '/nix/store/*' $PATH | path dirname)
      set --append fish_complete_path $roots/share/fish/vendor_completions.d
      set --append fish_function_path $roots/share/fish/vendor_functions.d
    '';
    interactiveShellInit = ''
      set fish_greeting

      abbr nix-run   --regex '^r#\S+' --function abbr-nix-run
      abbr nix-shell --regex '^s#\S+'    --function abbr-nix-shell
    '';
    shellAbbrs = {
      o = "omp";
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
      pkgs.fd # LazyVim
      pkgs.imagemagick # snacks.image
      pkgs.nodejs # copilot-language-server
      pkgs.ripgrep # LazyVim
    ];
  };

  programs.atuin = {
    enable = true;
    settings = {
      enter_accept = true;
      filter_mode_shell_up_key_binding = "session";
      inline_height = 15;
    };
  };

  programs.zoxide.enable = true;

  programs.direnv.enable = true;

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

  # Required by pkgs.antigravity-cli
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.antigravity-cli # Used by CodexBar
    pkgs.chezmoi
    pkgs.fzf
    pkgs.gh
    pkgs.ghq
    pkgs.vendir
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
