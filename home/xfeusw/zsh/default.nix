{ config, pkgs, lib, ... }:

let
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
        size = 50000;
        save = 50000;
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreSpace = true;
        extended = true;
      };

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
        ];
        theme = ""; # Using Starship instead
      };
    };
  }

  (import "${modulePath}/aliases.nix" { inherit pkgs; })

  (import "${modulePath}/init.nix" { inherit pkgs; })
]
