{ ... }:

{
  # X11 + GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Keyboard
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "eurosign:e,caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Input
  services.libinput.enable = true;

  # Apps
  programs.firefox.enable = true;
}
