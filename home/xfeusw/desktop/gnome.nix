# home/xfeusw/desktop/gnome.nix
{ pkgs, ... }:
let
  wallpaperPath = ../../../wallpaper/elizabeth.jpg;
in
{
  # GNOME-specific home manager configuration

  # GTK theme configuration
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      size = 24;
    };
  };

  # Configure dconf settings (GNOME settings)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
      icon-theme = "Adwaita";
      cursor-theme = "Adwaita";
    };

    "org/gnome/desktop/default-applications/terminal" = {
      exec = "ghostty";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      theme = "Adwaita";
    };

    # Set wallpaper (using relative path)
    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaperPath}";
      picture-uri-dark = "file://${wallpaperPath}";
      picture-options = "zoom";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "dev.zed.Zed.desktop"
        "com.mitchellh.ghostty.desktop"
        "code.desktop"
        "spotify.desktop"
      ];
    };

    # Keyboard shortcuts
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      maximize = ["<Super>Up"];
      minimize = ["<Super>Down"];
      show-desktop = ["<Super>d"];
      toggle-maximized = ["<Super>m"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "ghostty";
      name = "Terminal";
    };
  };
}
