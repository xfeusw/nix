{
  home-manager,
  pkgs,
  inputs,
  ...
}: {
  xfeusw = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {inherit inputs;};
    modules = [
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
      ./home/xfeusw/home.nix
    ];
  };
}
