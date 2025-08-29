{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos-acer";
  networking.networkmanager.enable = true;

  # Adjust as needed; currently disabled in original config
  networking.firewall.enable = false;
} 