{ ... }:
{
  imports = [
    ./graphics.nix
  ];

  # SSD optimization
  services.fstrim.enable = true;

  # Intel CPU specific configuration
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };

  # Bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Bluetooth management service
  services.blueman.enable = true;
}
