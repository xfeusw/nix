{
  inputs = {
    nixpkgs.url = "git+https://git.oss.uzinfocom.uz/xinux/nixpkgs?ref=nixos-unstable&shallow=1";

    xinux-lib = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/lib?ref=main&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xinux-modules = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/modules?ref=main&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-data = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/nix-data?ref=main&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    uz-xkb = {
      url = "github:itsbilolbek/uzbek-linux-keyboard";
      flake = false;
    };
    home-manager.url = "github:nix-community/home-manager";
    relago-support.url = "git+https://git.oss.uzinfocom.uz/xinux/relago-support";
    relago.url = "path:/home/xfeusw/workspace/xinux/relago";
    yandex-music.url = "git+https://codeberg.org/congeries/yandex-music-nix.git";
    # wallpapers.url = "path:/home/xfeusw/workspace/congeries/wallpapers";
    zen-browser = {
      url = "git+https://git.oss.uzinfocom.uz/mirrors/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    sops-nix.url = "github:mic92/sops-nix";
  };

  outputs =
    inputs:
    inputs.xinux-lib.mkFlake {
      inherit inputs;
      src = ./.;

      home-manager.backupFileExtension = "hm-backup";

      channels-config.allowUnfree = true;
      systems.modules.nixos = with inputs; [
        sops-nix.nixosModules.sops
        nix-data.nixosModules.nix-data
        xinux-modules.nixosModules.meta
        xinux-modules.nixosModules.efiboot
        # wallpapers.nixosModules.default
        relago-support.nixosModules.server
        relago.nixosModules.default
        # inputs.home-manager.flakeModules.home-manager
      ];
    };
}
