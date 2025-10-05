# home/xfeusw/desktop/plasma/packages.nix
{ pkgs, ... }:
{
  home.packages = with pkgs.kdePackages; [
    # Essential KDE Applications
    kate           # Text editor
    ark            # Archive manager
    gwenview       # Image viewer
    okular         # PDF viewer
    kcalc          # Calculator
    dolphin        # File manager
    konsole        # Terminal

    # Minimal utilities
    kfind          # File search

    # Themes and icons
  ] ++ (with pkgs; [
    bibata-cursors
  ]);
}
