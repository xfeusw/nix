# modules/packages/gnome.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # GNOME core applications
    nautilus         # File manager
    gnome-terminal   # Terminal
    gedit           # Text editor
    evince          # PDF viewer
    eog             # Image viewer
    gnome-screenshot # Screenshot tool
    file-roller     # Archive manager
    gnome-calculator
    gnome-system-monitor
    gnome-disk-utility

    # Additional GNOME utilities
    gnome-tweaks
    gnome-extension-manager
    dconf-editor

    # Popular GNOME extensions (you can install these manually too)
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
  ];
}
