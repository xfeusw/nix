# home/xfeusw/desktop/dconf/extensions/coverflow-alt-tab.nix
{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/coverflow-alt-tab" = {
      switcher-style = "coverflow";  # Options: coverflow, timeline
      animation-time = 0.3;          # Animation duration in seconds
      dim-factor = 0.4;              # Background dimming factor (0.0 to 1.0)
      preview-scale = 0.5;           # Window preview scale
      hide-panel = true;             # Hide panel during alt-tab
      icon-style = "overlay";        # Options: classic, overlay
    };
  };
}
