# modules/virtualization/containers.nix
{ ... }:
{
  # Podman container runtime (Docker alternative)
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
