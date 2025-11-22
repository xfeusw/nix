{...}: {
  programs.plasma = {
    configFile = {
      "dolphinrc" = {
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

      "konsolerc" = {
        "Desktop Entry" = {
          DefaultProfile = "DarkProfile.profile";
        };
      };

      "katerc" = {
        General = {
          "Default Encoding" = "UTF-8";
        };
        "KTextEditor Document" = {
          "Tab Width" = 4;
          "Replace Tabs" = true;
        };
        "KTextEditor View" = {
          "Font Family" = "JetBrainsMono Nerd Font";
          "Font Size" = 11;
        };
      };

      "baloorc" = {
        "Basic Settings" = {
          "Indexing-Enabled" = false;
        };
      };

      "krunnerrc" = {"Plugins" = {"baloosearchEnabled" = false;};};
      "plasma-thumbnailsrc" = {"General" = {"EnableThumbnails" = false;};};

      "kwinrc" = {
        Compositing = {
          OpenGLIsUnsafe = false;
          HiddenPreviews = 5;
          MaxFPS = 75;
          RefreshRate = 75;
          VSync = "none";
        };
        Plugins = {
          blurEnabled = true;
          contrastEnabled = true;
          wobblywindowsEnabled = false;
          backgroundcontrastEnabled = false;
        };
      };

      "kactivitymanagerdrc" = {
        "activities" = {
          "enabled" = false;
        };
        "Plugin-org.kde.ActivityManager.Resources.ScoringEnabled" = false;
      };
    };
  };

  home.file.".local/share/konsole/DarkProfile.profile".text = ''
    [Appearance]
    ColorScheme=Breeze
    Font=JetBrainsMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1

    [General]
    Name=DarkProfile
    Parent=FALLBACK/

    [Scrolling]
    HistoryMode=2
    ScrollBarPosition=2

    [Terminal Features]
    BlinkingCursorEnabled=true
  '';

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
