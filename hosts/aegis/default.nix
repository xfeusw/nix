{
  pkgs,
  inputs,
  ...
}:
let
  nixosModules = ./../../modules/nixos;

  sharedModules = [
    # "cosmic"
    "e-imzo"
    "fonts"
    "gnome"
    "nix-settings"
    "packages"
    # "plasma"
    "rust"
    "services"
    "security"
    # "steam"
    "usbguard"
    "virtualization"
  ];

  localModules = [
    "hardware"
    "networking"
    "performance"
    "users"
  ];
in
{
  imports = [
    ./hardware-configuration.nix
    # inputs.relago-support.nixosModules.server
    inputs.xinux-modules.nixosModules.branding
    inputs.xinux-modules.nixosModules.kernel
    inputs.xinux-modules.nixosModules.xinux
    # inputs.crash.nixosModules.c-segfault
    # inputs.crash.nixosModules.main
    # inputs.usbguard-gnome.nixosModules.default
  ]
  ++ map (m: nixosModules + "/${m}") sharedModules
  ++ map (m: ./${m}) localModules;

  # services.relago-server.enable = true;

  # services.xinux-c-segfault.enable = true;

  # services.experimentalus.enable = true;

  # Bootloader with enhanced options
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
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
      themePackages = [ pkgs.mac-style-plymouth ];
    };

    # kernelPackages = pkgs.linuxPackages_;
  };

  programs.nix-ld.enable = true;

  time.timeZone = "Asia/Tashkent";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
  };

  services.displayManager.sessionPackages = [ pkgs.niri ];
  security.pam.services.swaylock = { };
  # environment.systemPackages = with pkgs; [ niri ];
  programs.xwayland.enable = true;

  systemd.services.nixos-upgrade.enable = true;
  systemd.timers.nixos-upgrade.enable = true;

  system.stateVersion = "26.05";
}
