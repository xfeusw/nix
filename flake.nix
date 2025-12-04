{
  description = "NixOS configuration for acer and xeon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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
    treefmt-nix.url = "github:numtide/treefmt-nix";
    mac-style-plymouth = {
      url = "github:bemeritus/bemeritus-plymouth-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rtmp-server = {
      url = "/home/xfeusw/workspace/slip-stream/rtmp-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # tarmoqchi.url = "github:floss-uz-community/tarmoqchi";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      git-hooks,
      nixos-hardware,
      nur,
      niri,
      sops-nix,
      treefmt-nix,
      mac-style-plymouth,
      rtmp-server,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

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
                inherit (prev) system;
                config.allowUnfree = true;
              };
              mac-style-plymouth = mac-style-plymouth.packages.${system}.default;
            })
          ];
        }
      ];

      pre-commit-check = git-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          treefmt.enable = true;
          shellcheck.enable = true;
          check-merge-conflicts.enable = true;
        };
      };

      treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      nixosConfigurations = {
        acer = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/acer/configuration.nix
            nixos-hardware.nixosModules.common-cpu-intel
            nixos-hardware.nixosModules.common-pc-laptop
          ]
          ++ commonModules;
        };

        xeon = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/xeon/configuration.nix
            nixos-hardware.nixosModules.common-cpu-intel
            rtmp-server.nixosModules.${system}.rtmpServerModule
          ]
          ++ commonModules;
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

      devShells.${system}.default = import ./shell.nix {
        inherit pkgs;
        treefmt = treefmtEval.config.build.wrapper;
        gitHooksShellHook = pre-commit-check.shellHook;
        gitHooksPackages = pre-commit-check.enabledPackages;
      };

      formatter.${system} = treefmtEval.config.build.wrapper;

      checks.${system} = {
        formatting = treefmtEval.config.build.check pkgs.hello;
      };
    };
}
