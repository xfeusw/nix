{
  description = "Enhanced NixOS configuration (flake) for acer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode.url = "github:xfeusw/vscode";
    helix.url = "github:xfeusw/helix";

    niri.url = "github:xfeusw/niri";
    # niri.url = "/home/xfeusw/.config/niri";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    plasma-manager,
    nixos-hardware,
    nur,
    impermanence,
    nix-colors,
    firefox-addons,
    flake-utils,
    vscode,
    helix,
    niri,
    sops-nix,
    ...
  }: {
    nixosConfigurations = {
      acer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs nixpkgs-unstable;
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
              nur.overlays.default
              (final: prev: {
                unstable = import nixpkgs-unstable {
                  system = prev.system;
                  config.allowUnfree = true;
                };
                weston = prev.weston.overrideAttrs (old: {
                  mesonFlags = (old.mesonFlags or []) ++ ["-Dbackend-vnc=false"];
                });
              })
            ];

            nixpkgs.config = {
              allowUnfree = true;
              nvidia.acceptLicense = true;
            };

            nix.settings = {
              substituters = [
                "https://cache.nixos.org/"
                "https://nix-community.cachix.org"
                "https://hyprland.cachix.org"
                "https://nixpkgs-unfree.cachix.org"
              ];
              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
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
          inherit inputs nix-colors firefox-addons nur vscode helix niri sops-nix;
        };
        modules = [
          ./home/xfeusw/home.nix
          plasma-manager.homeModules.plasma-manager
          nix-colors.homeManagerModules.default
          niri.homeModules.niri
          niri.homeManagerModules.default
          sops-nix.homeModules.sops
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
      };
    };
  };
}
