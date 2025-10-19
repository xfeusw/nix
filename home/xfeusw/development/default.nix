{...}: {
  imports = [
    ./tools.nix
    ./haskell.nix
    ./rust.nix
  ];

  # home.packages = [
  #   nixvim-config.packages.${pkgs.system}.default
  # ];
}
