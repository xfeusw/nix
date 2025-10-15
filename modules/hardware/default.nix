# modules/hardware/default.nix
{...}: {
  imports = [
    ./graphics.nix
    ./cpu.nix
    ./bluetooth.nix
    ./ssd-optimization.nix
  ];
}
