{ nixvim-config, pkgs, ... }:
{
  imports = [
    ./languages
    ./tools.nix
  ];

  home.packages = [
    nixvim-config.packages.${pkgs.system}.default
  ];
}
