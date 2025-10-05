# home/xfeusw/desktop/plasma/applications.nix
{ ... }:
{
  programs.plasma = {
    configFile = {
      # Dolphin file manager configuration
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

      # Konsole terminal configuration
      "konsolerc" = {
        "Desktop Entry" = {
          DefaultProfile = "DarkProfile.profile";
        };
      };

      # Kate text editor configuration
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
    };
  };

  # Konsole profile
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
