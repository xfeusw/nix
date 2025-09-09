# modules/desktop/plasma.nix
{ config, lib, pkgs, ... }:

{
  # Enable X11 and Plasma 6 with Wayland support
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Keyboard configuration
  services.xserver.xkb = {
    layout = "us,ru";
    options = "eurosign:e,caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";
  };

  # Audio configuration with PipeWire
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable libinput for touchpad and mouse
  services.libinput.enable = true;

  # Firefox with Wayland optimizations
  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal" = true; # Wayland compatibility
      "gfx.webrender.all" = true; # Hardware acceleration
    };
  };
}
