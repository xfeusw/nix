{_}: {
  services.kdeconnect.enable = false;

  programs.plasma = {
    configFile = {
      # Global KDE settings
      "kdeglobals" = {
        General = {
          ColorScheme = "BreezeDark";
          Name = "Breeze Dark";
          widgetStyle = "Breeze";
        };
        KDE = {
          widgetStyle = "Breeze";
        };
      };

      # KWin configuration
      "kwinrc" = {
        Xwayland = {
          XwaylandMaximizeMode = 1;
        };
      };

      # Input device configuration
      "kcminputrc" = {
        Mouse = {
          XLbInptAccelProfileFlat = true;
        };
        Libinput = {
          NaturalScroll = true;
        };
      };

      # Notification configuration
      "plasmanotifyrc" = {
        Notifications = {
          PopupPosition = "TopRight";
        };
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
    SAL_USE_VCLPLUGIN = "kf6";
  };

  # Disable unwanted systemd services
  systemd.user.services = {
    drkonqi-coredump-pickup = {
      Unit = {
        After = ["graphical-session.target"];
        PartOf = ["graphical-session.target"];
      };
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };

    plasma-browser-integration.Unit.ConditionPathExists = "/dev/null";
  };
}
