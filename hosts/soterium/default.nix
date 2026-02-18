{
  pkgs,
  inputs,
  ...
}: let
  nixosModules = ./../../modules/nixos;

  sharedModules = [
    # "cosmic"
    "e-imzo"
    "fonts"
    "gnome"
    "nix-settings"
    "packages"
    # "plasma"
    "services"
    "security"
    "steam"
    "usbguard"
    "virtualization"
  ];

  localModules = [
    "hardware"
    "networking"
    "performance"
    "users"
  ];
in {
  imports =
    [
      ./hardware-configuration.nix
      # inputs.usbguard-gnome.nixosModules.default
    ]
    ++ map (m: nixosModules + "/${m}") sharedModules
    ++ map (m: ./${m}) localModules;

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
        # theme = "${
        #   (pkgs.fetchFromGitHub {
        #     owner = "xinux-org";
        #     repo = "bootloader-theme";
        #     tag = "v1.0.3";
        #     hash = "sha256-ipaiJiQ3r2B3si1pFKdp/qykcpaGV+EqXRwl6UkCohs=";
        #   })
        # }/xinux";
        theme = pkgs.grubThemes.cyber-re;
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
    # kernelPackages = pkgs.linuxPackages_zen;
  };

  programs.nix-ld.enable = true;

  time.timeZone = "Asia/Tashkent";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
  };

  services.displayManager.sessionPackages = [pkgs.niri];
  security.pam.services.swaylock = {};
  # environment.systemPackages = with pkgs; [ niri ];
  programs.xwayland.enable = true;

  systemd.services.nixos-upgrade.enable = false;
  systemd.timers.nixos-upgrade.enable = false;

  system.stateVersion = "26.05";
}
