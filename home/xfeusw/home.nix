{
  nur,
  lib,
  ...
}: {
  imports = [
    nur.modules.homeManager.default

    ./direnv
    # ./dunst
    ./firefox
    ./fuzzel
    ./ghostty
    ./git
    ./haskell
    ./helix
    ./mako
    ./niri
    ./packages
    ./plasma
    ./rust
    ./sops
    ./spotify
    ./starship
    ./sway
    ./vscode
    ./waybar
    ./yazi
    ./zed
    ./zsh
  ];

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
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
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
