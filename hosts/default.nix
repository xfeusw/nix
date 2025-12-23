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

  mkHost = {
    hostPath,
    hardwareModules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      specialArgs = {inherit inputs;};
      modules =
        [hostPath]
        ++ hardwareModules
        ++ commonModules;
    };
in {
  acer = mkHost {
    hostPath = ./acer;
    hardwareModules = [
      inputs.nixos-hardware.nixosModules.common-cpu-intel
      inputs.nixos-hardware.nixosModules.common-pc-laptop
    ];
  };

  xeon = mkHost {
    hostPath = ./xeon;
    hardwareModules = [
      inputs.nixos-hardware.nixosModules.common-cpu-intel
    ];
  };
}
