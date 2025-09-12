# home/xfeusw/desktop/plasma.nix
{ ... }:
{
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "default";
      colorScheme = "BreezeDark";
      wallpaper = ../../wallpaper/elizabeth.jpg;
      cursor = {
        theme = "Breeze";
        size = 24;
      };
      iconTheme = "breeze-dark";
    };

    # Enhanced panel configuration
    panels = [
      {
        location = "top";
        height = 32;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          {
            systemTray = {
              items = {
                shown = [
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.volume"
                  "org.kde.plasma.battery"
                ];
              };
            };
          }
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    # Configure some applications
    configFile = {
      # Dolphin file manager settings
      dolphinrc = {
        General = {
          BrowseThroughArchives = true;
          OpenExternallyCalledFolderInNewTab = true;
          ShowFullPath = true;
        };
      };

      # Kate text editor settings
      katerc = {
        General = {
          "Auto Hide Tabs" = false;
          "Close After Last" = false;
          "Show Menu Bar" = true;
        };
      };

      # Konsole terminal settings
      konsolerc = {
        "Desktop Entry" = {
          DefaultProfile = "Profile 1.profile";
        };
      };
    };

    # Enhanced shortcuts
    shortcuts = {
      "services/org.kde.krunner.desktop"._launch = [ "Alt+Space" ];
      "kwin" = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Window Close" = "Meta+Q";
        "Window Maximize" = "Meta+Up";
        "Window Minimize" = "Meta+Down";
        "Show Desktop" = "Meta+D";
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
      };
    };

    # Window rules
    window-rules = [
      {
        description = "Konsole transparency";
        match = {
          window-class = {
            value = "konsole";
            type = "substring";
          };
        };
        apply = {
          noborder = {
            value = false;
            apply = "initially";
          };
        };
      }
    ];
  };
}
