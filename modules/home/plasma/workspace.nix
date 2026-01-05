{config, ...}: {
  programs.plasma = {
    workspace = {
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      cursor.theme = "Bibata-Original-Classic";
      splashScreen.theme = "None";

      wallpaper = "${config.home.homeDirectory}/.local/share/wallpapers/elizabeth.jpg";
    };

    hotkeys.commands = {
      "launch-konsole" = {
        name = "Launch Konsole";
        key = "Meta+Return";
        command = "konsole";
      };
    };

    configFile = {
      "kickoffrc" = {
        Favorites = {
          FavoriteApps = "org.kde.dolphin.desktop,firefox.desktop,org.kde.kate.desktop";
        };
      };

      "plasmashellrc" = {
        PlasmaViews = {
          panelVisibility = 0;
        };
      };
    };
  };

  home = {
    file = {
      ".local/share/wallpapers/elizabeth.jpg".source = ../../../wallpapers/elizabeth.jpg;

      ".config/plasma-workspace/env/home-manager-paths.sh".text = ''
        export XDG_DATA_DIRS="$HOME/.nix-profile/share:$HOME/.local/share:$XDG_DATA_DIRS"
      '';
    };

    sessionVariables = {
      KDE_SESSION_VERSION = "6";
      XDG_CURRENT_DESKTOP = "KDE";
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
}
