# modules/virtualization.nix
{ pkgs, ... }:
{
  # Podman instead of Docker for rootless containers
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    # KVM/QEMU virtualization
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };
      };
    };

    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [ spice-vdagent ];
}
