# home/xfeusw/desktop/plasma/workspace.nix
{ config, ... }:
{
  home.file.".local/share/wallpapers/elizabeth.jpg".source = ../../../wallpapers/elizabeth.jpg;

  home.file.".config/plasma-workspace/env/home-manager-paths.sh".text = ''
    export XDG_DATA_DIRS="$HOME/.nix-profile/share:$HOME/.local/share:$XDG_DATA_DIRS"
  '';

  programs.plasma = {
    workspace = {
      # Theme and appearance
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      cursor.theme = "Bibata-Modern-Ice";
      splashScreen.theme = "None";

      # Wallpaper configuration
      wallpaper = "${config.home.homeDirectory}/.local/share/wallpapers/elizabeth.jpg";
    };

    # Hotkeys configuration
    hotkeys.commands = {
      "launch-konsole" = {
        name = "Launch Konsole";
        key = "Meta+Return";
        command = "konsole";
      };
    };

    configFile = {
      # Kickoff configuration
      "kickoffrc" = {
        Favorites = {
          FavoriteApps = "org.kde.dolphin.desktop,firefox.desktop,org.kde.kate.desktop";
        };
      };

      # Panel configuration
      "plasmashellrc" = {
        PlasmaViews = {
          panelVisibility = 0;
        };
      };
    };
  };

  # Environment variables for Plasma workspace
  home.sessionVariables = {
    KDE_SESSION_VERSION = "6";
    XDG_CURRENT_DESKTOP = "KDE";
    QT_QPA_PLATFORM = "wayland;xcb";
  };
}
