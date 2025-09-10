# modules/home-manager.nix
{ inputs, ... }:

{
  # Enable Home Manager and import user home configuration
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.xfeusw = {
    imports = [ ../home/xfeusw/home.nix ];
  };
}
