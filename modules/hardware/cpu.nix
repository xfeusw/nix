# modules/hardware/cpu.nix
{ ... }:
{
  # Intel CPU specific configuration
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
