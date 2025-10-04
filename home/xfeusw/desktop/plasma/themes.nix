# home/xfeusw/desktop/plasma/themes.nix
{ pkgs, ... }:
{
  # GTK theme integration
  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.breeze-gtk;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.breeze-icons;
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
    platformTheme = "kde";
    style = {
      name = "breeze";
      package = pkgs.breeze-qt5;
    };
  };

  programs.plasma = {
    # Additional theming configurations
    configFile = {
      # Breeze theme settings
      "breezerc".settings = {
        Common.ShadowSize = "ShadowVeryLarge";
        "kdeglobals"."General".ColorScheme = "BreezeDark";
      };

      # Font configuration
      "kdeglobals.KFonts".settings = {
        activeFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        fixed = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        smallestReadableFont = "Noto Sans,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        toolBarFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
        menuFont = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      };
    };
  };
}
