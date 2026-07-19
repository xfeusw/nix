{ ... }: {
  services.xserver.videoDrivers = [ "vmware" ];

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    # vmware = {
    #   host.enable = true;
    #   guest.enable = true;
    # };
  };
}
