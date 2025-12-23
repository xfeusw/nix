{
  description = "NixOS configuration for acer and xeon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
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
    treefmt-nix.url = "github:numtide/treefmt-nix";
    mac-style-plymouth = {
      url = "github:bemeritus/bemeritus-plymouth-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # tarmoqchi.url = "github:floss-uz-community/tarmoqchi";
  };

  outputs = {
    nixpkgs,
    home-manager,
    git-hooks,
    treefmt-nix,
    nixvim,
    android-nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    commonModules = [
      inputs.nur.modules.nixos.default
      inputs.niri.nixosModules.niri
      inputs.sops-nix.nixosModules.sops
      {
        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [
          inputs.nur.overlays.default
          (final: prev: {
            mac-style-plymouth = inputs.mac-style-plymouth.packages.${system}.default;
          })
        ];
      }
    ];

    pre-commit-check = git-hooks.lib.${system}.run {
      src = ./.;
      hooks = {
        treefmt.enable = true;
        check-merge-conflicts.enable = true;
      };
    };

    treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
  in {
    nixosConfigurations = import ./hosts;

    homeConfigurations = import ./home;

    devShells.${system}.default = import ./shell.nix {
      inherit pkgs;
      treefmt = treefmtEval.config.build.wrapper;
      gitHooksShellHook = pre-commit-check.shellHook;
      gitHooksPackages = pre-commit-check.enabledPackages;
    };

    formatter.${system} = treefmtEval.config.build.wrapper;

    # checks.${system} = {
    #   formatting = treefmtEval.config.build.check pkgs.hello;
    # };
  };
}
