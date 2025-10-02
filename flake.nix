{
  description = "Enhanced NixOS configuration (flake) for acer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    impermanence.url = "github:nix-community/impermanence";
    nix-colors.url = "github:misterio77/nix-colors";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-config = {
      url = "github:Ahwxorg/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    nixpkgs-wayland,
    home-manager,
    nixos-hardware,
    nur,
    nixvim-config,
    impermanence,
    nix-colors,
    firefox-addons,
    sops-nix,
    flake-utils,
    hyprland,
    ...
  }: {
    nixosConfigurations = {
      acer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          inherit nixpkgs-unstable nixpkgs-wayland;
        };
        modules = [
          ./hosts/acer/configuration.nix
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-ssd
          nixos-hardware.nixosModules.common-pc-laptop
          nur.modules.nixos.default
          sops-nix.nixosModules.sops

          {
            nixpkgs.overlays = [
              nixpkgs-wayland.overlay
              nur.overlays.default
              (final: prev: {
                unstable = import nixpkgs-unstable {
                  system = prev.system;
                  config.allowUnfree = true;
                };
              })
            ];

            nix.settings = {
              substituters = [
                "https://cache.nixos.org/"
                "https://nixpkgs-wayland.cachix.org"
                "https://nix-community.cachix.org"
                "https://hyprland.cachix.org"
                "https://nixpkgs-unfree.cachix.org"
              ];
              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "nixpkgs-wayland.cachix.org-1:3lwxaILJ2uV7M2uAyUBFx3L6Z8YQoa9N2vXgm6Q34Yo="
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
                "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
              ];
            };
          }
        ];
      };
    };

    homeConfigurations = {
      xfeusw = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs nixvim-config nix-colors firefox-addons nur;
        };
        modules = [
          ./home/xfeusw/home.nix
          nix-colors.homeManagerModules.default
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              nixpkgs-wayland.overlay
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
      };
    };
  };
}
