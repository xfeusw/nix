# hosts/acer/configuration.nix
{...}: {
  imports = [
    ./hardware-configuration.nix

    # Core system modules
    ../../modules/nix-settings.nix
    ../../modules/networking.nix
    ../../modules/users.nix
    ../../modules/security.nix
    ../../modules/performance.nix

    # Desktop environment
    ../../modules/desktop/plasma.nix

    # Modular imports
    ../../modules/packages
    ../../modules/hardware
    ../../modules/services.nix
    ../../modules/virtualization
  ];

  # Bootloader with enhanced options
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelModules = ["tcp_bbr"];
  };

  time.timeZone = "Asia/Tashkent";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
  };

  systemd.services.nixos-upgrade.enable = false;
  systemd.timers.nixos-upgrade.enable = false;

  system.stateVersion = "25.05";
}
