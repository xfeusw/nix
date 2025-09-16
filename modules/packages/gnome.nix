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

    # GNOME extensions
    gnomeExtensions.dash-to-panel
    gnomeExtensions.appindicator
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
    gnomeExtensions.arc-menu
    gnomeExtensions.tiling-assistant
    gnomeExtensions.date-menu-formatter
    gnomeExtensions.top-icons-plus
    gnomeExtensions.sound-output-device-chooser
  ];
}
