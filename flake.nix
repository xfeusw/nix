# flake.nix
{
  description = "NixOS configuration (flake) for acer";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Add nixvim input
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable"; # Use unstable for latest features
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      acer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inputs = { inherit nixpkgs nixpkgs-unstable home-manager nixvim; };
          inherit nixpkgs nixpkgs-unstable home-manager nixvim;
        };
        modules = [
          ./hosts/acer/configuration.nix
        ];
      };
    };

    # Updated homeConfigurations with nixvim
    homeConfigurations = {
      xfeusw = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit nixpkgs nixpkgs-unstable nixvim;
          unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          # Add nixvim home-manager module
          nixvim.homeManagerModules.nixvim
          ./home/xfeusw/home.nix
        ];
      };
    };
  };
}
