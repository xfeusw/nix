# modules/nix.nix
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
    home-manager
    # Node.js + pnpm
    unstable.nodejs_22
    pnpm

    # Ruby (without neovim gem)
    ruby

    # Rust
    rustup
    cargo

    # C/C++ toolchain
    gcc
    clang
    cmake
    gnumake
    pkg-config
    gdb

    # Haskell
    haskell.compiler.ghc96
    cabal-install
    stack

    # Scala / JVM
    jdk
    sbt
    scala

    # Containers
    docker-client
    docker-compose
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
