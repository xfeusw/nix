{ config, lib, pkgs, ... }:

{
  # Wayland utilities
  home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    swappy
    waybar
  ];

  # Session variables for Wayland support
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
