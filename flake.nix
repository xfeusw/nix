{
  description = "NixOS configuration for acer and xeon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    impermanence.url = "github:nix-community/impermanence";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    helix.url = "github:helix-editor/helix";
    niri.url = "github:sodiboo/niri-flake";
    sops-nix.url = "github:Mic92/sops-nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, nur, niri, sops-nix, ... } @ inputs:
  let
    system = "x86_64-linux";

    commonModules = [
      nur.modules.nixos.default
      niri.nixosModules.niri
      sops-nix.nixosModules.sops
      {
        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [
          nur.overlays.default
          (final: prev: {
            unstable = import nixpkgs-unstable {
              system = prev.system;
              config.allowUnfree = true;
            };
          })
        ];
      }
    ];
  in {
    nixosConfigurations = {
      acer = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/acer/configuration.nix
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-laptop
        ] ++ commonModules;
      };

      xeon = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/xeon/configuration.nix
          nixos-hardware.nixosModules.common-cpu-intel
        ] ++ commonModules;
      };
    };

    homeConfigurations.xfeusw = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = { inherit inputs; };
      modules = [
        inputs.plasma-manager.homeModules.plasma-manager
        inputs.nix-colors.homeManagerModules.default
        inputs.niri.homeModules.niri
        inputs.sops-nix.homeModules.sops
        inputs.spicetify-nix.homeManagerModules.default
        nur.modules.homeManager.default
        {
          nixpkgs.overlays = [
            nur.overlays.default
            (final: prev: {
              unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            })
          ];
        }
        ./home/xfeusw/home.nix
      ];
    };
  };
}
