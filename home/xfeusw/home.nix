{
  nur,
  pkgs,
  lib,
  niri,
  helix,
  ...
}: {
  imports = [
    nur.modules.homeManager.default
    helix.homeManagerModules.default

    ./direnv
    ./ghostty
    ./git
    ./haskell
    ./packages
    ./plasma
    ./rust
    ./spotify
    ./starship
    ./vscode
    ./yazi
    ./zsh
  ];

  programs.vscode.enable = true;
  programs.helix.installExtraPackages = false;
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home = {
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
    sessionVariables = lib.mkForce {
      XDG_DATA_DIRS = "$HOME/.nix-profile/share:$HOME/.local/share:/run/current-system/sw/share:/usr/share:/usr/local/share";
      EDITOR = "hx";
      VISUAL = "hx";
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
  };
}
