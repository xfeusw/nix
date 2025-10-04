{ pkgs, ... }:
{
  home.packages = with pkgs; [

  ] ++ (with pkgs.unstable; [
    # Browsers
    brave
    firefox-devedition
    google-chrome
    tor-browser
    browserpass

    # Communication
    telegram-desktop
    discord
    zoom-us

    # Media
    spotify
    vlc
    mpv
    # gimp3-with-plugins
    # obs-studio

    # Productivity
    pdftk
    unrar
    p7zip
    copyq

    # Text editors
    vscode
    zed-editor
  ]);
}
