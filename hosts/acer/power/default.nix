{_}: {
  networking = {
    hostName = "nixos-xeon";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    firewall = {
      allowedTCPPorts = [57 621];
      allowedUDPPorts = [5353];
    };

    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services = {
    blueman.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
