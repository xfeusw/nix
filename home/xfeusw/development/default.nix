# home/xfeusw/development/default.nix
{ nixvim-config, pkgs, ... }:
{
  imports = [
    ./languages
    ./tools.nix
  ];

  # Add nixvim
  home.packages = [
    nixvim-config.packages.${pkgs.system}.default
  ];
}
