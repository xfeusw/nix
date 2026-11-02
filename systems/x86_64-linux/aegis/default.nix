{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ./bluetooth.nix
    ./hardware.nix
    ./software.nix
    ./mic.nix
    ./modules.nix
    ./mxmaster.nix
    ./gaming.nix
    ./postgresql.nix
    # ./ventoy.nix
    ./wireguard.nix
  ];

  spotify-xfeusw.enable = true;
  musnix.enable = true;

  # programs.linuwowo = {
  #   enable = true;
  #   json = ../../../linuwowo.json;

  #   # Optional: Automatically start the cpuid-fault-emulation service at boot.
  #   # If false, you can start/stop the service manually.
  #   cpuidFaultEmulation.enable = true;
  # };

  networking.hostName = "aegis";

  modules.graphical.provider = "nvidia";

  services.xserver.xkb = {
    layout = "uz";
    variant = "latin";
  };

  console.useXkbConfig = true;

  users.users.xfeusw = {
    isNormalUser = true;
    description = "xfeusw";

    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
      "docker"
      "relago"
      "adbusers"
      "audio"
      "video"
      "kvm"
    ];

    initialPassword = "a";
  };

  nix.settings.trusted-users = [
    "root"
    "xfeusw"
  ];

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/xfeusw/workspace/congeries/xinux-config/systems/x86_64-linux/aegis/default.nix";
    flake = "/home/xfeusw/workspace/congeries/xinux-config/flake.nix";
    flakearg = "aegis";
  };

  # virtualisation.vmware.host.enable = true;

  boot.kernelPackages =
    inputs.nix-cachyos-kernel.legacyPackages.x86_64-linux.linuxPackages-cachyos-latest;

  boot.loader.grub = {
    enable = true;

    theme = lib.mkForce inputs.space-isolation.packages.${pkgs.system}.theme-1920x1200;
  };

  services.relago.enable = false;

  system.stateVersion = "26.11";
}
