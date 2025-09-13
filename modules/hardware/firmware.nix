# modules/hardware/firmware.nix
{ ... }:
{
  # Firmware updates
  services.fwupd.enable = true;
}
