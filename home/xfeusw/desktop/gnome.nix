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
      text-scaling-factor = 0.9;
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
        "org.telegram.desktop.desktop"
      ];
      enabled-extensions = [
        "dash-to-panel@jderose9.github.com"
        "appindicator@ubuntu.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "gsconnect@andyholmes.github.io"
        "caffeine@patapon.info"
        "arcmenu@arcmenu.com"
        "tiling-assistant@leleat-on-github"
        "date-menu-formatter@marcinjakubowski.github.com"
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

    # Date Menu Formatter settings (USA format)
    "org/gnome/shell/extensions/date-menu-formatter" = {
      format = "%a %b %d, %Y %I:%M %p"; # USA format: e.g., "Mon Sep 16, 2025 10:30 AM"
      advanced-formatter = false; # Use basic strftime (sufficient for USA)
      text-alignment = "left"; # Align text to the left
      show-date = true; # Show date
      show-time = true; # Show time
    };

    # Dash to Panel settings for 90% scaling and bottom positioning
    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-position = "TOP"; # Place the panel at the bottom
      panel-size = 30;
      appicon-margin = 4;
      appicon-padding = 4;
      animate-show-apps = true;
      show-activities-button = true;
      show-desktop-icon = true;
      multi-monitor = false;
      window-preview-size = 150;
      scroll-action = "CYCLE_WINDOWS";
    };

    # Vitals settings
    "org/gnome/shell/extensions/vitals" = {
      show-cpu = true; # Show CPU usage
      show-memory = true; # Show memory usage
      show-disk = true; # Show disk usage
      show-network = true; # Show network usage
      show-temperature = true; # Show system temperature (if sensors available)
      show-fan = false; # Disable fan speed (not always available)
      position-in-panel = "right"; # Place Vitals in the right side of the panel
      update-time = 2; # Update every 2 seconds
      use-higher-precision = true; # Higher precision for stats
    };

    # User Themes settings
    "org/gnome/shell/extensions/user-theme" = {
      name = "Adwaita-dark"; # Use Adwaita-dark shell theme to match GTK
    };

    # Blur My Shell settings
    "org/gnome/shell/extensions/blur-my-shell" = {
      sigma = 30; # Blur intensity
      brightness = 0.6; # Background brightness
      dash = true; # Apply blur to dash
      overview = true; # Apply blur to overview
      panel = true; # Apply blur to panel
    };

    # Clipboard Indicator settings
    "org/gnome/shell/extensions/clipboard-indicator" = {
      history-size = 50; # Store up to 50 clipboard entries
      strip-text = true; # Remove formatting from clipboard
      toggle-menu = "<Super>v"; # Keyboard shortcut to open clipboard menu
    };

    # GSConnect settings
    "org/gnome/shell/extensions/gsconnect" = {
      show-indicators = true; # Show phone indicators in panel
      enabled = true; # Enable GSConnect
    };

    # Caffeine settings
    "org/gnome/shell/extensions/caffeine" = {
      show-indicator = true; # Show caffeine icon in panel
      toggle-state = false; # Start in inactive state
    };

    # ArcMenu settings
    "org/gnome/shell/extensions/arc-menu" = {
      menu-layout = "Default"; # Use default menu layout
      show-searchbar = true; # Show search bar in menu
    };

    # Tiling Assistant settings
    "org/gnome/shell/extensions/tiling-assistant" = {
      enable-tiling = true; # Enable window tiling
      tile-maximize = true; # Allow maximizing in tiling mode
    };

    # Dash to Dock settings
    # "org/gnome/shell/extensions/dash-to-dock" = {
    #   dock-position = "BOTTOM"; # Place the dock at the bottom
    #   icon-size = 25; # Approximately 90% of default 48px
    #   extend-height = false;
    #   dock-fixed = false;
    #   autohide = true;
    #   show-trash = false;
    #   transparency-mode = "FIXED";
    #   background-opacity = 0.8;
    #   show-mounts = false;
    #   show-running = true;
    #   show-apps-at-top = false;
    # };
  };
}
