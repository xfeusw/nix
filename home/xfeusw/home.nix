{ config, pkgs, lib, ... }:
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  
  # Fix version mismatch warning
  home.enableNixpkgsReleaseCheck = false;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [
    tree
    telegram-desktop
    zed-editor
    code-cursor  # This will now work
    vscode
    spotify
    yandex-music
    discord
    tor-browser
    brave
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    fira-code
    jetbrains-mono
  ];
}