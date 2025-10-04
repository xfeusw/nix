# home/xfeusw/desktop/plasma/integration.nix
{ ... }:
{
  # KDE Connect for phone integration
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  # Plasma browser integration
  services.plasma-browser-integration.enable = true;

  programs.plasma = {
    # Global configuration files
    configFile = {
      # Global KDE settings
      "kdeglobals".settings = {
        General = {
          ColorScheme = "BreezeDark";
          Name = "Breeze Dark";
          widgetStyle = "Breeze";
        };
        "KDE".widgetStyle = "Breeze";
      };

      # KWin configuration
      "kwinrc".settings = {
        WindowsBorderless = true;
        XwaylandMaximize = true;
        XwaylandFullscreen = true;
      };

      # Input device configuration
      "kcminputrc".settings = {
        "Mouse".XLbInptAccelProfileFlat = true;
        "Touchpad".NaturalScroll = true;
      };

      # Notification configuration
      "plasmanotifyrc".settings = {
        Notifications.PopupPosition = "TopRight";
      };
    };
  };

  # Additional environment variables
  home.sessionVariables = {
    # Scaling and display
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    # Backend preferences
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    # Application-specific
    SAL_USE_VCLPLUGIN = "kf5";
  };
}
