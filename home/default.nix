{
  home-manager,
  pkgs,
  inputs,
  wallpaper,
  ...
}: let
  commonModules = [
    inputs.sops-nix.homeModules.sops
    inputs.nur.modules.homeManager.default
    {
      nixpkgs.overlays = [
        inputs.nur.overlays.default
      ];
    }
    inputs.zen-browser.homeModules.twilight
  ];

  mkHome = {
    userPath,
    extraModules ? [],
    extraSpecialArgs ? {},
  }:
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit inputs wallpaper;
      };

      modules = with inputs;
        [
          nix-colors.homeManagerModules.default
        ]
        ++ commonModules
        ++ [userPath]
        ++ extraModules;
    };
in {
  xfeusw = mkHome {
    userPath = ./xfeusw;
  };
}
