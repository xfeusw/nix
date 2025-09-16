# flake.nix
{
  description = "Enhanced NixOS configuration (flake) for acer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware optimization
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Additional useful inputs
    nur.url = "github:nix-community/NUR";

    # Your personal nixvim configuration
    nixvim-config = {
      url = "github:Ahwxorg/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixos-hardware,
      nur,
      nixvim-config,
      ...
    }:
    {
      nixosConfigurations = {
        acer = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inputs = {
              inherit
                nixpkgs
                nixpkgs-unstable
                home-manager
                nixos-hardware
                nur
                nixvim-config
                ;
            };
            inherit
              nixpkgs
              nixpkgs-unstable
              home-manager
              nixos-hardware
              nur
              nixvim-config
              ;
          };
          modules = [
            ./hosts/acer/configuration.nix
            nur.modules.nixos.default
          ];
        };
      };

      homeConfigurations = {
        xfeusw = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit
              nixpkgs
              nixpkgs-unstable
              nixvim-config
              nur
              ;
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            ./home/xfeusw/home.nix
            nur.modules.homeManager.default
          ];
        };
      };
    };
}
