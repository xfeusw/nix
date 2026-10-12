{
  inputs = {
    nixpkgs.url = "git+https://git.oss.uzinfocom.uz/xinux/nixpkgs?ref=nixos-unstable&shallow=1";

    xinux-lib = {
      url = "git+https://git.oss.uzinfocom.uz/xinux/lib?ref=main&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xinux-modules = {
      url = "git+https://git.oss.uzinfocom.uz/xfeusw/modules?ref=main&shallow=1";
      # url = "/home/xfeusw/workspace/xinux/modules";
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
    # relago-support.url = "git+https://git.oss.uzinfocom.uz/xinux/relago-support";
    # relago.url = "path:/home/xfeusw/workspace/xinux/relago";
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
    disko = {
      url = "git+https://git.oss.uzinfocom.uz/mirrors/disko?ref=master&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ngrok.url = "github:ngrok/ngrok-nix";
    sls-steam = {
      url = "github:AceSLS/SLSsteam";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    enter-the-wired = {
      url = "github:ciscosweater/enter-the-wired";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    release-notes-assistant = {
      url = "git+https://codeberg.org/congeries/release-notes-assistant?ref=main&shallow=1";
    };
    space-isolation.url = "github:xfeusw/space-isolation";
    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    amethyst.url = "github:ChrisDKN/Amethyst-Mod-Manager";
    xeonitte.url = "git+https://git.oss.uzinfocom.uz/xinux/xeonitte?ref=main&shallow=1";
    # lsfg-vk.url = "github:xfeusw/lsfg-vk";
    lsfg-vk.url = "path:///home/xfeusw/workspace/github/lsfg-vk";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    inputs:
    inputs.xinux-lib.mkFlake {
      inherit inputs;
      src = ./.;

      home-manager.backupFileExtension = "hm-backup";

      channels-config = {
        allowUnfree = true;
        android_sdk.accept_license = true;
      };
      systems.modules.nixos = with inputs; [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        nix-data.nixosModules.nix-data
        xinux-modules.nixosModules.meta
        xinux-modules.nixosModules.efiboot
        lsfg-vk.nixosModules.default
        # wallpapers.nixosModules.default
        # relago-support.nixosModules.server
        ngrok.nixosModules.ngrok
        spicetify-nix.nixosModules.default
        # chaotic.nixosModules.default
        # relago.nixosModules.default
        # inputs.home-manager.flakeModules.home-manager
      ];
      homes.modules = with inputs; [
        spicetify-nix.homeManagerModules.default
      ];
    };
}
