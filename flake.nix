{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

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

    boot-club = {
      url = "github:NewDawn0/boot-club";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      # home-manager.follows = "home-manager";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nur.url = "github:nix-community/NUR";
    impermanence.url = "github:nix-community/impermanence";
    nix-colors.url = "github:misterio77/nix-colors";
    helix.url = "github:helix-editor/helix";
    niri.url = "github:sodiboo/niri-flake";
    sops-nix.url = "github:Mic92/sops-nix";
    yandex-music.url = "github:xfeusw/yandex-music-nix";

    # crash.url = "path:/home/xfeusw/workspace/xinux-org/crash";

    # relago = {
    #   url = "github:xinux-org/relago/bootstrap-relago-module";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     nixpkgs-unstable.follows = "nixpkgs-unstable";
    #   };
    # };

    # tarmoqchi.url = "github:floss-uz-community/tarmoqchi";

    # usbguard-gnome.url = "github:xfeusw/usbguard-gnome";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = pkg:
          builtins.elem (pkgs.lib.getName pkg) [
            "steam"
            "steam-original"
            "steam-unwrapped"
            "steam-run"
          ];
        nvidia.acceptLicense = true;
        android_sdk.accept_license = true;
        permittedInsecurePackages = [
          "olm-3.2.16"
        ];
      };
      overlays = [
        (import ./overlays)
        (final: prev: {
          stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        })
        inputs.yandex-music.overlays.default
      ];
    };

    treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    formatterVar = treefmtEval.config.build.wrapper;
    wallpaper = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/xfeusw/nix/1fc84abf17f28e43e1b863df639afb345e86e9fd/wallpapers/133.jpg";
      sha256 = "105ljph96bkvvfzwfy6gdyxjfxynn26g61j2q43z8iw7w9k1fjgx";
    };
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
        wallpaper
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
