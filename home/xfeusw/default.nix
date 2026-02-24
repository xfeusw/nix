{
  lib,
  pkgs,
  ...
}: let
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
    "rust"
    "sops"
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
in {
  imports = map (m: homeModules + "/${m}/") modules;

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home = {
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";
    stateVersion = "26.05";
    enableNixpkgsReleaseCheck = false;
    sessionVariables = lib.mkForce {
      XDG_DATA_DIRS = "$HOME/.nix-profile/share:$HOME/.local/share:/run/current-system/sw/share:/usr/share:/usr/local/share";
      EDITOR = "nvim";
      VISUAL = "nvim";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
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
