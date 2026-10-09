{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./software.nix
    ./modules.nix
    ./mxmaster.nix
    ./gaming.nix
    ./postgresql.nix
    ./ventoy.nix
  ];

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

  virtualisation.vmware.host.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub = {
    enable = true;

    theme = lib.mkForce inputs.space-isolation.packages.${pkgs.system}.theme-1920x1200;
  };

  services.relago.enable = false;

  system.stateVersion = "26.11";
}
