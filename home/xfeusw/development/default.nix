{ ... }:
{
  imports = [
    ./tools.nix
    ./nix.nix
  ];

  # home.packages = [
  #   nixvim-config.packages.${pkgs.system}.default
  # ];
}
