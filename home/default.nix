{
  home-manager,
  pkgs,
  inputs,
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
  ];

  mkHome = {
    userPath,
    extraModules ? [],
    extraSpecialArgs ? {},
  }:
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;} // extraSpecialArgs;
      modules = with inputs;
        [
          nixvim.homeModules.nixvim
          plasma-manager.homeModules.plasma-manager
          nix-colors.homeManagerModules.default
          niri.homeModules.niri
          android-nixpkgs.hmModule
        ]
        ++ commonModules ++ [userPath] ++ extraModules;
    };
in {
  xfeusw = mkHome {
    userPath = ./xfeusw;
  };
}
