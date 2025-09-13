# modules/hardware/default.nix
{ ... }:
{
  imports = [
    ./graphics.nix
    ./cpu.nix
    ./bluetooth.nix
    ./firmware.nix
    ./ssd-optimization.nix
  ];
}
