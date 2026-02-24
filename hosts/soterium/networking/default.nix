{...}: {
  networking = {
    hostName = "soterium";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    firewall = {
      allowedTCPPorts = [
        22
        57
        621
      ];
      allowedUDPPorts = [
        22
        5353
        8888
      ];
    };

    # Faster DNS
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services.blueman.enable = true;

  # mDNS for local network discovery
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  # };
}
