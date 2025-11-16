# modules/networking.nix
{ ... }:
{
  networking = {
    hostName = "nixos-xeon";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    firewall = {
      allowedTCPPorts = [ 57 621 ];
      allowedUDPPorts = [ 5353 ];
    };

    # Faster DNS
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services.blueman.enable = true;

  # mDNS for local network discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
