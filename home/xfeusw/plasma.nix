# home/xfeusw/plasma.nix
{ ... }:

{
  programs.plasma = {
    enable = true;

    # Workspace settings
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "default";
      colorScheme = "BreezeDark";
      wallpaper = ../../wallpaper/elizabeth.jpg;
    };

    # Configure panels
    panels = [
      {
        location = "top";
        height = 32; # Panel height in pixels (default is usually 44)
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
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

      # Global shortcuts
      kglobalshortcutsrc = {
        "org.kde.krunner.desktop" = {
          "_k_friendly_name" = "KRunner";
          "_launch" = "Alt+Space\\tAlt+F2\\tSearch,Alt+Space\\tAlt+F2\\tSearch,KRunner";
        };
      };
    };

    # Hotkeys/shortcuts
    shortcuts = {
      "services/org.kde.krunner.desktop" = {
        "_launch" = [
          "Alt+Space"
          "Alt+F2"
        ];
      };
      "kwin" = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
      };
    };

    # Window management
    window-rules = [
      {
        description = "Konsole";
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
