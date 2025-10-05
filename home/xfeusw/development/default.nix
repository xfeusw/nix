{ nixvim-config, pkgs, ... }:
{
  imports = [
    ./tools.nix
    ./languages
  ];

  home.packages = [
    nixvim-config.packages.${pkgs.system}.default
  ];
}
