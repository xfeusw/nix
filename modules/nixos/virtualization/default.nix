{pkgs, ...}: {
  # Podman container runtime (Docker alternative)
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # KVM/QEMU virtualization
  virtualisation = {
    spiceUSBRedirection.enable = true;
  };

  # Virtual machine manager
  programs.virt-manager.enable = true;

  # SPICE guest agent for better VM integration
  environment.systemPackages = with pkgs; [spice-vdagent];
}
