{
  home-manager,
  pkgs,
  inputs,
  ...
}: let
  commonModules = [
    inputs.plasma-manager.homeModules.plasma-manager
    inputs.nix-colors.homeManagerModules.default
    inputs.niri.homeModules.niri
    inputs.sops-nix.homeModules.sops
    inputs.nixvim.homeModules.nixvim
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
      modules = commonModules ++ [userPath] ++ extraModules;
    };
in {
  xfeusw = mkHome {
    userPath = ./xfeusw;
  };
}
