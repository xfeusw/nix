# modules/hardware/bluetooth.nix
{ ... }:
{
  # Bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Bluetooth management service
  services.blueman.enable = true;
}
