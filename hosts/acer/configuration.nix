# hosts/acer/configuration.nix
{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nix-settings.nix
    ../../modules/system-packages.nix
    ../../modules/networking.nix
    ../../modules/desktop/plasma.nix
    ../../modules/users.nix
    ../../modules/services.nix
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

  # Enable ZRAM for memory compression
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  # NixOS compatibility version
  system.stateVersion = "25.05";
}
