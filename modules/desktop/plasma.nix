{ config, lib, pkgs, ... }:

{
  # X11 + Plasma 6
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

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