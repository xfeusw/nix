# home/xfeusw/home.nix
{ config, pkgs, lib, unstable ? null, nixvim, ... }:
let
  unstablePkgs = if unstable != null then unstable else
    import <nixpkgs-unstable> {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  # Fix version mismatch warning
  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.allowUnfree = true;

  # Import modular configurations
  imports = [
    ./nixvim
    ./settings.nix
    ./packages.nix
    ./git.nix
    ./zsh.nix
    ./kitty.nix
  ];
}
