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
    # relago-support.url = "path:/home/xfeusw/workspace/xinux/relago-support";
    # relago.url = "path:/home/xfeusw/workspace/xinux/relago";
    yandex-music.url = "git+https://codeberg.org/congeries/yandex-music-nix.git";
  };

  outputs =
    inputs:
    inputs.xinux-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config.allowUnfree = true;
      systems.modules.nixos = with inputs; [
        nix-data.nixosModules.nix-data
        xinux-modules.nixosModules.meta
        xinux-modules.nixosModules.efiboot
        # relago-support.nixosModules.server
        # relago.nixosModules.default
        # inputs.home-manager.flakeModules.home-manager
      ];
    };
}
