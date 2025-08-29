{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nix.nix
    ../../modules/networking.nix
    ../../modules/desktop/gnome.nix
    ../../modules/users.nix
    ../../modules/services.nix
    ../../modules/home-manager.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Asia/Samarkand";

  # For more information, see `man configuration.nix` or the manual.
  system.stateVersion = "25.05";
} 