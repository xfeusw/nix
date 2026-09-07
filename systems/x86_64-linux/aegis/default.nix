# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./modules.nix
    ./graphics.nix
    # ./disko.nix
  ];

  # Define your hostname.
  networking.hostName = "aegis";

  # Set the keyboard layout.
  services.xserver.xkb = {
    layout = "uz";
    variant = "latin";
  };

  console.useXkbConfig = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."xfeusw" = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
      "podman"
      "relago"
    ];
    initialPassword = "a";
  };

  nix.settings.trusted-users = [
    "root"
    "xfeusw"
  ];

  # Allow unfree packages
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    libreoffice
    nautilus
    gnome-system-monitor
    jetbrains-mono
    nil
    nixd
    git
    podman
    podman-compose
    pods
    podman-tui
    runc
    conmon
    skopeo
    slirp4netns
    fuse-overlayfs
    zoxide
    woeusb-ng
    ntfs3g
    ghostty
    telegram-desktop
    element-desktop
    fluffychat
    fastfetch
    # nerd-fonts.jetbrains-mono
    haskellPackages.tree-sitter-haskell
    haskellPackages.cabal-gild
    haskell-language-server
    nixfmt
    bazaar
    gnome-tweaks
    bibata-cursors
    # helvetica-neue-lt-std
    tree
    spotify
    helix
    rPackages.figma
    # qemu_full
    yandex-music-bin
    # slidev-cli
    postman
    fxlinuxprint
    foomatic-db-nonfree
    foomatic-db-ppds-withNonfreeDb
    cameractrls-gtk4
    heroic
    treefmt
    # proton-ge-bin
    # protonup-ng
    gparted
    gnome-disk-utility
    tor-browser
    cloudflared
    ngrok
  ];

  system.stateVersion = "26.11";

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/xfeusw/.config/nix/systems/x86_64-linux/aegis/default.nix";
    flake = "/home/xfeusw/.config/nix/flake.nix";
    flakearg = "aegis";
  };

  nixpkgs.config = {
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-unwrapped"
      ];
  };

  programs.nix-ld.enable = true;
  programs.gamescope.enable = true;
  services.udev.packages = [ pkgs.game-devices-udev-rules ];
  hardware.uinput.enable = true;

  nixpkgs.overlays = [
    inputs.yandex-music.overlays.default
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  nix.settings.substituters = [ "https://cache.xinux.uz?priority=10" "https://cache.nixos.org/" ];
  nix.settings.trusted-public-keys = [
    "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  #   extraCompatPackages = with pkgs; [
  #     proton-ge-bin
  #     protonup-qt
  #   ];
  # };

  # programs.gamemode.enable = true;

  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = lib.mkForce false;
  # };

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   open = true;
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;

  #   prime = {
  #     sync.enable = true;
  #     intelBusId = "PCI:1:0:0";
  #     nvidiaBusId = "PCI:6:0:0";
  #   };
  # };

  # services.xserver.videoDrivers = [
  #   "nvidia"
  # ];

  # 01:00.0 VGA compatible controller: NVIDIA Corporation GA107 [GeForce RTX 2050] (rev a1)
  # 06:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt [Radeon 680M] (rev 0b)

  # services.relago-server = {
  #   enable = true;
  #   osPassword = "Str0ng!Passw0rd@2025";
  #   s3KeyId = "GKf39328305ea6dad6b4831a7e";
  #   s3SecretKey = "ed6f8f8f2a300602e1acaab2fbf5b856658a9a04cb33c2b20903159133917c12";
  #   s3MainBucket = "default-bucket";
  # };

  # services.relago = {
  #   enable = true;
  #   nix-config = "/home/xfeusw/.config/xinux-config";
  #   server = "http://localhost:4242";
  # };
}
