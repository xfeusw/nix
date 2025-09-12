# hosts/acer/configuration.nix
{ inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nix-settings.nix
    ../../modules/system-packages.nix
    ../../modules/networking.nix
    ../../modules/desktop/plasma.nix
    ../../modules/users.nix
    ../../modules/services.nix
    ../../modules/security.nix
    ../../modules/hardware.nix
    ../../modules/power.nix
    ../../modules/virtualization.nix
    ../../modules/backup.nix
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  # Bootloader with enhanced options
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    # Kernel optimizations
    kernelParams = [
      "quiet"
      "splash"
      "mitigations=off" # Better performance, slightly less security
    ];

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.dirty_ratio" = 5;
      "vm.dirty_background_ratio" = 2;
      "net.core.rmem_max" = 16777216;
      "net.core.wmem_max" = 16777216;
    };
  };

  # Timezone and localization
  time.timeZone = "Asia/Samarkand";
  i18n.defaultLocale = "en_US.UTF-8";

  # NixOS compatibility version
  system.stateVersion = "25.05";
}
