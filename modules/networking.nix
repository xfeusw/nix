{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos-acer";
  networking.networkmanager.enable = true;

  # Firewall is currently disabled; enable and open specific ports when needed
  networking.firewall.enable = false;
} 