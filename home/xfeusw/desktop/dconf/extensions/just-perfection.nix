# home/xfeusw/desktop/dconf/extensions/just-perfection.nix
{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/just-perfection" = {
      activities-button = false;  # Hide Activities button
      panel = true;              # Show panel
      dash = true;               # Show dash
      workspace-switcher = true; # Show workspace switcher
      theme = true;              # Allow theme customization
    };
  };
}
