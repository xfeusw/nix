# home/xfeusw/desktop/dconf/extensions/workspace-indicator.nix
{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/workspace-indicator" = {
      show-names = true;       # Show workspace names
      position = "right";      # Position in panel
    };
  };
}
