# hosts/acer/configuration.nix
{ ... }:
{
  imports = [
    ./hardware-configuration.nix

    # Core system modules
    ../../modules/nix-settings.nix
    ../../modules/networking.nix
    ../../modules/users.nix
    ../../modules/security.nix
    ../../modules/power.nix
    ../../modules/backup.nix

    # Desktop environment
    ../../modules/desktop/gnome.nix

    # Modular imports (new structure)
    ../../modules/packages # All package categories
    ../../modules/hardware # All hardware configurations
    ../../modules/services # All services
    ../../modules/virtualization # All virtualization

    # Hardware-specific (uncomment as needed)
    # inputs.nixos-hardware.nixosModules.common-cpu-intel
    # inputs.nixos-hardware.nixosModules.common-pc-ssd
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
