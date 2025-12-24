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

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-style-plymouth = {
      url = "github:bemeritus/bemeritus-plymouth-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    impermanence.url = "github:nix-community/impermanence";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    helix.url = "github:helix-editor/helix";
    niri.url = "github:sodiboo/niri-flake";
    sops-nix.url = "github:Mic92/sops-nix";
    # tarmoqchi.url = "github:floss-uz-community/tarmoqchi";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        nvidia.acceptLicense = true;
        android_sdk.accept_license = true;
      };
      permittedInsecurePackages = [
        "olm-3.2.16"
      ];
    };

    treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    formatterVar = treefmtEval.config.build.wrapper;
  in {
    nixosConfigurations = import ./hosts {
      inherit
        inputs
        pkgs
        nixpkgs
        system
        ;
    };

    homeConfigurations = import ./home {
      inherit
        inputs
        home-manager
        pkgs
        ;
    };

    devShells.${system}.default = import ./shell.nix {
      inherit
        pkgs
        inputs
        system
        treefmtEval
        ;
    };

    formatter.${system} = formatterVar;

    # checks.${system} = {
    #   formatting = treefmtEval.config.build.check pkgs.hello;
    # };
  };
}
