{
  config,
  pkgs,
  lib,
  ...
}: let
  modulePath = ./.;
in
  lib.mkMerge [
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        completionInit = ''
          autoload -Uz compinit
          compinit
        '';
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        history = {
          size = 500000;
          save = 500000;
          extended = true;
        };

        dotDir = config.home.homeDirectory;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "sudo"
            "history"
            "colored-man-pages"
            "command-not-found"
            "extract"
            "z"
            "history-substring-search"
            "podman"
            "npm"
            "web-search"
            "rust"
            "urltools"
          ];
          theme = ""; # Using Starship instead
        };
      };
    }

    (import "${modulePath}/aliases.nix" {inherit pkgs;})

    (import "${modulePath}/init.nix" {inherit pkgs;})
  ]
