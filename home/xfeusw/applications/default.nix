{ pkgs, vscode, helix, ... }:
{
  imports = [
    vscode.homeManagerModules.vscode
    helix.homeManagerModules.default
  ];
  programs.vscode.enable = true;
  programs.helix.installExtraPackages = false;

  home.packages = with pkgs.unstable; [
    # Browsers
    brave
    firefox-devedition
    google-chrome
    tor-browser

    # Communication
    telegram-desktop
    discord

    # Media
    spotify
    vlc
    mpv

    # Productivity
    pdftk
    unrar
    p7zip
    copyq

    # Text editors
    vscode
    zed-editor
  ];
}
