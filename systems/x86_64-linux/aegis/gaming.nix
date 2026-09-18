{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  accela = inputs.enter-the-wired.packages.${pkgs.system}.default;
in
{
  environment.systemPackages = [
    accela
    pkgs.heroic
    pkgs.protontricks
    pkgs.mangohud
    pkgs.protonup-qt
  ];

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
