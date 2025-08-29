{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nix.nix
    ../../modules/networking.nix
    ../../modules/desktop/plasma.nix
    ../../modules/users.nix
    ../../modules/services.nix
    ../../modules/home-manager.nix
    ../../modules/docker.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Timezone
  time.timeZone = "Asia/Samarkand";

  # NixOS compatibility version
  system.stateVersion = "25.05";
} 