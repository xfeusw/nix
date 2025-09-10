# modules/docker.nix
{ ... }:

{
  # Podman instead of Docker for rootless containers
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Provides Docker CLI compatibility
  };

  users.users.xfeusw.extraGroups = [ "wheel" ]; # Remove docker group
}
