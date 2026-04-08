{
  lib,
  pkgs,
  ...
}:
let
  homeModules = ./../../modules/home;

  modules = [
    # "android"
    "direnv"
    # "dunst"
    "emacs"
    "firefox"
    "fuzzel"
    "ghostty"
    "git"
    "gnome"
    "go"
    "haskell"
    "helix"
    "java"
    "mako"
    "niri"
    "nixvim"
    "packages"
    # "plasma"
    # "python"
    # "sops"
    # "spotify"
    "starship"
    "sway"
    "vscode"
    "waybar"
    "yazi"
    "zed"
    "zen"
    "zsh"
  ];

  browser = "zen-beta.desktop";
in
{
  imports = map (m: homeModules + "/${m}/") modules;

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home = {
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";
    stateVersion = "26.05";
    enableNixpkgsReleaseCheck = false;
    sessionVariables = lib.mkForce {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;
      };
    };
    systemDirs.data = [
      "/run/current-system/sw/share"
      "/usr/share"
      "/usr/local/share"
    ];
    userDirs.enable = true;
    configFile."mimeapps.list".force = true;
  };

  gtk.enable = true;
}
