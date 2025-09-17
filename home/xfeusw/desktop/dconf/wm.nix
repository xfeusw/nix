{ ... }:
{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      # Default GNOME window controls (no minimize button)
      # button-layout = "appmenu:close";           # Only close button on the right
      button-layout = ":minimize,maximize,close"; # All buttons on right
      # Alternative: button-layout = "close,minimize,maximize:"; # All buttons on left
      theme = "Adwaita-dark";
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      maximize = ["<Super>Up"];
      minimize = ["<Super>Down"];
      show-desktop = ["<Super>d"];
      toggle-maximized = ["<Super>m"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "ghostty";
      name = "Terminal";
    };
  };
}
