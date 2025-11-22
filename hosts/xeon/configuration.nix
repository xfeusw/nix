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
    ./users
  ];

  # Bootloader with enhanced options
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        #splashImage = ./background.png;
        useOSProber = true;
        efiSupport = true;
        theme = "${
          (pkgs.fetchFromGitHub {
            owner = "xinux-org";
            repo = "bootloader-theme";
            tag = "v1.0.3";
            hash = "sha256-ipaiJiQ3r2B3si1pFKdp/qykcpaGV+EqXRwl6UkCohs=";
          })
        }/xinux";
      };
    };

    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [pkgs.mac-style-plymouth];
    };

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    initrd.verbose = false;
    initrd.systemd.enable = true;
    consoleLogLevel = 3;
    kernelModules = ["tcp_bbr"];
    kernelPackages = pkgs.linuxPackages_zen;
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

  services.displayManager.sessionPackages = [pkgs.niri];
  # environment.systemPackages = with pkgs; [ niri ];
  programs.xwayland.enable = true;

  systemd.services.nixos-upgrade.enable = false;
  systemd.timers.nixos-upgrade.enable = false;

  system.stateVersion = "25.05";
}
