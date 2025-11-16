# hosts/acer/configuration.nix
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    # Core system modules
    ../../modules/fonts
    ../../modules/nix-settings
    ../../modules/packages
    ../../modules/plasma
    ../../modules/services
    ../../modules/security
    ../../modules/virtualization

    ./hardware
    ./networking
    ./performance
    ./power
    ./users
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

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];

  services.displayManager.sessionPackages = [ pkgs.niri ];
  environment.systemPackages = with pkgs; [ niri ];
  programs.xwayland.enable = true;

  systemd.services.nixos-upgrade.enable = false;
  systemd.timers.nixos-upgrade.enable = false;

  system.stateVersion = "25.05";
}
