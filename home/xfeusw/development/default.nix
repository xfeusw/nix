{ ... }:
{
  imports = [
    ./tools.nix
    ./nix.nix
    ./haskell.nix
  ];

  # home.packages = [
  #   nixvim-config.packages.${pkgs.system}.default
  # ];
}
