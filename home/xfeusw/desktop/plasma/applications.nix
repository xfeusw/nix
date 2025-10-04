# home/xfeusw/desktop/plasma/applications.nix
{ ... }:
{
  programs.plasma = {
    # Dolphin file manager configuration
    dolphin = {
      settings = {
        General = {
          RememberOpenedTabs = false;
          ShowFullPath = true;
          ShowFullPathInTitlebar = true;
        };
        DetailsMode = {
          PreviewSize = 32;
          FontSize = 9;
        };
        KFileDialog = {
          ShowHidden = true;
          AutoSelectExtension = false;
        };
      };
    };

    # Konsole terminal configuration
    konsole = {
      general = {
        DefaultProfile = "DarkProfile";
      };
      profiles = {
        DarkProfile = {
          background-color = "#1e1e2e";
          color-scheme = "CatppuccinMocha";
          font = "JetBrainsMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          foreground-color = "#cdd6f4";
          # Additional terminal settings
          "Appearance" = {
            ColorScheme = "CatppuccinMocha";
          };
          "Scrolling" = {
            HistoryMode = 2;
            ScrollBarPosition = 2;
          };
        };
      };
    };

    # Kate text editor configuration
    kate = {
      settings = {
        General = {
          "Default Encoding" = "UTF-8";
        };
        Editor = {
          "Font Family" = "JetBrainsMono Nerd Font";
          "Font Size" = 11;
          "Tab Width" = 4;
          "Replace Tabs" = true;
        };
      };
    };

    # System Settings configuration
    systemsettings = {
      # You can add specific system settings configurations here
    };
  };

  # XDG MIME type associations
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "org.kde.dolphin.desktop";
      "text/plain" = "org.kde.kate.desktop";
      "text/markdown" = "org.kde.kate.desktop";
      "application/pdf" = "org.kde.okular.desktop";
      "image/png" = "org.kde.gwenview.desktop";
      "image/jpeg" = "org.kde.gwenview.desktop";
      "image/gif" = "org.kde.gwenview.desktop";
      "image/webp" = "org.kde.gwenview.desktop";
      "image/svg+xml" = "org.kde.gwenview.desktop";
      "video/x-matroska" = "org.kde.dragonplayer.desktop";
      "video/mp4" = "org.kde.dragonplayer.desktop";
      "audio/mpeg" = "org.kde.elisa.desktop";
    };
  };
}
