{ lib, ... }:
{
  # Use zram swap — safe system-wide default
  zramSwap = {
    enable = lib.mkDefault true;
    memoryPercent = lib.mkDefault 100;
    algorithm = lib.mkDefault "zstd";
  };

  # Auto system updates
  system.autoUpgrade = {
    enable = lib.mkDefault true;
    flake = lib.mkDefault "/home/xfeusw/.config/nix";
    dates = lib.mkDefault "weekly";
    randomizedDelaySec = lib.mkDefault "2h";
    allowReboot = lib.mkDefault false;
  };

  # SSD trimming
  services.fstrim.enable = lib.mkDefault true;

  # CPU and power
  powerManagement = {
    enable = lib.mkDefault true;
    cpuFreqGovernor = lib.mkDefault "schedutil";
  };
}
