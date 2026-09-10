{ ... }: {
  services.xserver.videoDrivers = [ "vmware" ];

  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
    };
  };
}
