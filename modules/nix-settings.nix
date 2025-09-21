# modules/nix-settings.nix
{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "auto-allocate-uids"
      ];

      auto-optimise-store = true;
      builders-use-substitutes = true;
      warn-dirty = false;

      # Performance optimizations
      max-jobs = "auto";
      cores = 0;  # Use all available cores
      download-buffer-size = 134217728;  # 128 MB

      # Build optimization
      connect-timeout = 5;
      stalled-download-timeout = 90;

      # Sandbox settings
      sandbox = true;
      restrict-eval = true;

      # Trusted users
      trusted-users = [ "root" "@wheel" ];
    };

    # Optimized garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d --max-freed 15G";
      persistent = true;
    };

    # Store optimization
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };

    # Nix daemon settings
    daemonCPUSchedPolicy = "batch";
    daemonIOSchedClass = "best-effort";
    daemonIOSchedPriority = 7;
  };

  # Enable flakes and new nix command globally
  environment.systemPackages = with pkgs; [
    nixpkgs-fmt
    alejandra
    nil
    nixd
    nix-tree
    nix-du
    nix-index
    nix-output-monitor
    cachix
    nix-fast-build
  ];
}
