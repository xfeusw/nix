{
  inputs,
  nixpkgs,
  system,
  commonModules,
  ...
}: {
  acer = nixpkgs.lib.nixosSystem {
    inherit system;
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
    inherit system;
    specialArgs = {inherit inputs;};
    modules =
      [
        ./xeon
        inputs.nixos-hardware.nixosModules.common-cpu-intel
      ]
      ++ commonModules;
  };
}
