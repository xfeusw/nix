# home/xfeusw/desktop/dconf/extensions/sound-output-device-chooser.nix
{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/sound-output-device-chooser" = {
      show-input-devices = true;    # Show input devices in the menu
      show-output-devices = true;   # Show output devices in the menu
      icon-position = "right";      # Position of the icon in the panel
    };
  };
}
