{
  description = "NixOS configuration (flake) for acer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      acer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inputs = { inherit nixpkgs nixpkgs-unstable home-manager; }; };
        modules = [
          ./hosts/acer/configuration.nix
        ];
      };
    };

    devShells = {
      x86_64-linux = let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        unstable = import nixpkgs-unstable { inherit system; config = pkgs.config; };
      in {
        default = pkgs.mkShell {
          name = "dev-env";
          buildInputs = [
            # Node.js + pnpm
            unstable.nodejs_22
            pkgs.pnpm

            # Rust
            pkgs.rustup
            pkgs.cargo

            # C/C++ toolchain
            pkgs.gcc
            pkgs.clang
            pkgs.cmake
            pkgs.gnumake
            pkgs.pkg-config
            pkgs.gdb

            # Haskell
            pkgs.haskell.compiler.ghc96
            pkgs.cabal-install
            pkgs.stack

            # Scala / JVM
            pkgs.jdk
            pkgs.sbt
            pkgs.scala

            # Containers
            pkgs.docker-client
            pkgs.docker-compose
          ];
        };
      };
    };
  };
} 