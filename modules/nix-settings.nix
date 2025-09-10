# modules/nix-settings.nix
{ inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Expose unstable as pkgs.unstable
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = prev.system;
        config = prev.config;
      };
    })
  ];

  # Automatic upgrades from this flake
  system.autoUpgrade = {
    enable = true;
    flake = "/home/xfeusw/.config/nix";
    flags = [
      "--update-input"
      "nixpkgs"
      "--update-input"
      "nixpkgs-unstable"
      "--commit-lock-file"
    ];
    dates = "03:00";
    randomizedDelaySec = "45min";
  };

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d --max-freed 10G";
  };

  # Enable ZRAM for memory compression
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
