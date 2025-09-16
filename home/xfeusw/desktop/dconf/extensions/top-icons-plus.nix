# home/xfeusw/desktop/dconf/extensions/top-icons-plus.nix
{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/top-icons-plus" = {
      icon-spacing = 6;         # Spacing between icons
      tray-position = "right";  # Position of the tray (left, center, right)
      icon-size = 24;           # Size of the tray icons
      icon-opacity = 100;       # Icon opacity (0-100)
    };
  };
}
