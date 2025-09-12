# home/xfeusw/applications/productivity.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Office suite
    libreoffice-qt

    # Note taking
    obsidian

    # PDF tools
    pdftk

    # Archive tools
    unrar
    p7zip

    # Password manager
    keepassxc

    # Clipboard manager
    copyq

    # Screenshot tools (already included in KDE)
    flameshot
  ];
}
