{ pkgs, inputs, ... }:
{
  imports = [
    inputs.vscode.homeManagerModules.vscode
  ];
  programs.vscode.enable = true;

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
