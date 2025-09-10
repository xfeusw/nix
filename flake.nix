# flake.nix
{
  description = "NixOS configuration (flake) for acer";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Your personal nixvim configuration
    nixvim-config = {
      # url = "github:khamrakulov/nixvim";
      url = "github:Ahwxorg/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager.url = "github:nix-community/plasma-manager";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixvim-config,
      plasma-manager,
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
                nixvim-config
                plasma-manager
                ;
            };
            inherit
              nixpkgs
              nixpkgs-unstable
              home-manager
              nixvim-config
              plasma-manager
              ;
          };
          modules = [
            ./hosts/acer/configuration.nix
          ];
        };
      };

      # Updated homeConfigurations with your nixvim
      homeConfigurations = {
        xfeusw = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit
              nixpkgs
              nixpkgs-unstable
              nixvim-config
              plasma-manager
              ;
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            ./home/xfeusw/home.nix
          ];
        };
      };
    };
}
