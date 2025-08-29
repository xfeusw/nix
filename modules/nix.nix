{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.overlays = [
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = prev.system;
        config = prev.config;
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gh
  ];
} 