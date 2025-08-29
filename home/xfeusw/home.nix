{ config, pkgs, lib, ... }:

{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tree
    telegram-desktop
    zed-editor
    code-cursor
    vscode
    spotify
    yandex-music
    discord
    tor-browser
    brave
  ];
} 