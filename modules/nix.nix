{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Expose unstable as pkgs.unstable
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = prev.system;
        config = prev.config;
      };
    })
  ];

  # Base CLI tools
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gh
  ];

  # Automatic upgrades from this flake
  system.autoUpgrade = {
    enable = true;
    flake = "/home/xfeusw/.config/nix";
    flags = [ "--update-input" "nixpkgs" "--update-input" "nixpkgs-unstable" "--commit-lock-file" ];
    dates = "03:00";
    randomizedDelaySec = "45min";
  };

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}