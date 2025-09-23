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
    ../../modules/performance.nix
    ../../modules/backup.nix

    # Desktop environment
    ../../modules/desktop/gnome.nix

    # Modular imports
    ../../modules/packages
    ../../modules/hardware
    ../../modules/services
    ../../modules/virtualization

    ../../modules/scripts
  ];

  # Bootloader with enhanced options
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;  # Limit boot entries
        editor = false;  # Security: disable boot editor
      };
      efi.canTouchEfiVariables = true;
      timeout = 2;  # Reduced timeout
    };

    # Kernel optimizations
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    # Faster boot
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelModules = [ "tcp_bbr" ];  # Better congestion control
  };

  # Timezone and localization
  time.timeZone = "Asia/Samarkand";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
  };

  # Secrets management
  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "/home/xfeusw/.config/sops/age/keys.txt";
    secrets = {
      user-password.neededForUsers = true;
      restic-password = {
        owner = "root";
        mode = "0600";
      };
    };
  };

  # NixOS compatibility version
  system.stateVersion = "25.05";
}
