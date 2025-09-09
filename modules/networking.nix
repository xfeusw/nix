# modules/networking.nix
{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos-acer";
  networking.networkmanager.enable = true;

  # Enable firewall with specific open ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ]; # SSH
    allowedUDPPorts = [ ];
  };
}
