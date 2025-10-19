{ ... }:
{
  imports = [
    ./tools.nix
    ./haskell.nix
  ];

  # home.packages = [
  #   nixvim-config.packages.${pkgs.system}.default
  # ];
}
