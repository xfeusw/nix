{ pkgs, ... }:
{
  # Podman container runtime (Docker alternative)
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation = {
    spiceUSBRedirection.enable = true;
    vmware.guest.enable = true;
    vmware.host.enable = true;
  };

  # Virtual machine manager
  programs.virt-manager.enable = true;

  # SPICE guest agent for better VM integration
  environment.systemPackages = with pkgs; [ spice-vdagent ];

  services.xserver.videoDrivers = [ "vmware" ];
}
