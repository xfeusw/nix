# modules/hardware.nix
{ pkgs, ... }:
{
  # Hardware acceleration
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;

    # Bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # SSD optimization
  services.fstrim.enable = true;

  # Firmware updates
  services.fwupd.enable = true;
}
