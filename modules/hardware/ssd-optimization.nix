# modules/hardware/ssd-optimization.nix
{ ... }:
{
  # SSD optimization
  services.fstrim.enable = true;
}
