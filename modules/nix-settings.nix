# modules/nix-settings.nix
{ inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      builders-use-substitutes = true;

      # Increase download buffer size to prevent warnings
      download-buffer-size = 134217728; # 128 MB (default is 64 MB)

      # Substituters for faster builds
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      ];
    };

    # More aggressive garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d --max-freed 15G";
    };
  };

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

  # Enable ZRAM for memory compression
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
