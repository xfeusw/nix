# modules/networking.nix
{ ... }:

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
