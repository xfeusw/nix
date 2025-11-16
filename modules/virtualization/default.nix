# modules/virtualization/default.nix
{pkgs, ...}: {
  # Podman container runtime (Docker alternative)
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # KVM/QEMU virtualization
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
      };
    };

    spiceUSBRedirection.enable = true;
  };

  # Virtual machine manager
  programs.virt-manager.enable = true;

  # SPICE guest agent for better VM integration
  environment.systemPackages = with pkgs; [spice-vdagent];
}
