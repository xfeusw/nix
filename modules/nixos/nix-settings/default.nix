{
  pkgs,
  config,
  lib,
  ...
}:
{
  nix = {
    # extraOptions = lib.mkIf (config.sops.secrets ? gh_token) ''
    #   access-tokens = github.com=$(cat ${config.sops.secrets.gh_token.path})
    # '';

    settings = {
      # access-tokens = lib.mkIf (config.sops.secrets ? gh_token) [
      #   "github.com=${builtins.readFile config.sops.secrets.gh_token.path}"
      # ];
      #

      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "auto-allocate-uids"
        "pipe-operators"
      ];

      auto-optimise-store = true;
      builders-use-substitutes = true;
      warn-dirty = false;

      # Performance optimizations
      max-jobs = "auto";
      cores = 0; # Use all available cores
      download-buffer-size = 2147483648; # 128 MB

      # Build optimization
      connect-timeout = 20;
      stalled-download-timeout = 400;

      # Sandbox settings
      sandbox = true;
      restrict-eval = false;

      # Trusted users
      trusted-users = [
        "root"
        "@wheel"
      ];
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
