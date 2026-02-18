{ pkgs, ... }:
{
  # GTK theme integration
  gtk = {
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # Qt theme integration
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style = {
      name = "breeze";
    };
  };

  programs.plasma = {
    # Plasma configuration files
    configFile = {
      # Breeze theme settings
      "breezerc" = {
        Common = {
          ShadowSize = "ShadowVeryLarge";
        };
      };

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

        # Font configuration
        WM = {
          activeFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        };

        General = {
          fixed = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          font = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          menuFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          smallestReadableFont = "Noto Sans,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
          toolBarFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        };
      };
    };
  };
}
