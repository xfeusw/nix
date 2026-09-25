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
let
  space-isolation = inputs.space-isolation.packages.${pkgs.system};
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./modules.nix
    ./gaming.nix
    # ./graphics.nix
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
      "docker"
      "relago"
    ];
    initialPassword = "a";
  };

  nix.settings.trusted-users = [
    "root"
    "xfeusw"
  ];

  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  environment.systemPackages = with pkgs; [
    nautilus
    jetbrains-mono
    nil
    nixd
    git
    zoxide
    woeusb-ng
    ntfs3g
    ghostty
    telegram-desktop
    element-desktop
    fastfetch
    haskellPackages.tree-sitter-haskell
    haskellPackages.cabal-gild
    haskell-language-server
    nixfmt
    bazaar
    gnome-tweaks
    bibata-cursors
    tree
    spotify
    helix
    postman
    cameractrls-gtk4
    treefmt
    gparted
    gnome-disk-utility
    tor-browser
    cloudflared
    ngrok
    discord
    qbittorrent
    mpv
    makemkv
    shntool
    flac
    flacon
  ];

  system.stateVersion = "26.11";

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/xfeusw/workspace/congeries/xinux-config/systems/x86_64-linux/aegis/default.nix";
    flake = "/home/xfeusw/workspace/congeries/xinux-config/flake.nix";
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

  nix.settings.substituters = [
    "https://cache.xinux.uz?priority=10"
    "https://cache.nixos.org/"
  ];
  nix.settings.trusted-public-keys = [
    "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  virtualisation.vmware.host.enable = true;

  boot.loader.grub = {
    enable = true;

    theme = lib.mkForce space-isolation.theme-1920x1200;
  };

  services.relago.enable = false;
}
