{
  inputs,
  pkgs,
  nixpkgs,
  system,
  ...
}: let
  commonModules = [
    inputs.nur.modules.nixos.default
    inputs.niri.nixosModules.niri
    inputs.sops-nix.nixosModules.sops
    {
      nixpkgs.overlays = [
        inputs.nur.overlays.default
        (final: prev: {
          mac-style-plymouth = inputs.mac-style-plymouth.packages.${system}.default;
        })
      ];
    }
  ];
in {
  acer = nixpkgs.lib.nixosSystem {
    inherit system pkgs;
    specialArgs = {inherit inputs;};
    modules =
      [
        ./acer
        inputs.nixos-hardware.nixosModules.common-cpu-intel
        inputs.nixos-hardware.nixosModules.common-pc-laptop
      ]
      ++ commonModules;
  };

  xeon = nixpkgs.lib.nixosSystem {
    inherit system pkgs;
    specialArgs = {inherit inputs;};
    modules =
      [
        ./xeon
        inputs.nixos-hardware.nixosModules.common-cpu-intel
      ]
      ++ commonModules;
  };
}
