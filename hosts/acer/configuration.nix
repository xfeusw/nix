# hosts/acer/configuration.nix
{ ... }:
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

  # Timezone
  time.timeZone = "Asia/Samarkand";

  # NixOS compatibility version
  system.stateVersion = "25.05";
}
