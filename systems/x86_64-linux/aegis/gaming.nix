{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  accela = inputs.enter-the-wired.packages.${pkgs.system}.default;
  amethyst = inputs.amethyst.packages.${pkgs.system}.default;
in
{
  environment.systemPackages = [
    accela
    amethyst
    pkgs.heroic
    pkgs.protontricks
    pkgs.mangohud
    pkgs.protonup-qt
  ];

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    intelBusId = "PCI:0@0:2:0";
    nvidiaBusId = "PCI:1@0:0:0";
  };

  programs.steam = {
    enable = true;

    gamescopeSession.enable = true;

    package = pkgs.steam.override {
      extraEnv = {
        LD_AUDIT = "${
          inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
        }/library-inject.so:${
          inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
        }/SLSsteam.so";
      };
    };
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
