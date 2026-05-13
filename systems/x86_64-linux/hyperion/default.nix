# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware.nix
      ./modules.nix
    ];

    # Define your hostname.
  networking.hostName = "hyperion";



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
    extraGroups = [ "wheel" "networkmanager" "dialout" "podman" ];
  };

  nix.settings.trusted-users = [ "root" "xfeusw" ];

  # Allow unfree packages
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

    # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    libreoffice
    nautilus
    gnome-system-monitor
    jetbrains-mono
    nil
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
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

  programs.nix-data = {
    enable = true;
    systemconfig = "/home/xfeusw/.config/nix/systems/x86_64-linux/hyperion/default.nix";
    flake = "/home/xfeusw/.config/nix/flake.nix";
    flakearg = "hyperion";
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
