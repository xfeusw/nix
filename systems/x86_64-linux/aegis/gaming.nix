{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  accela = inputs.enter-the-wired.packages.${pkgs.system}.default;
  amethyst-unwrapped = inputs.amethyst.packages.${pkgs.system}.default;

  # For Amethyst proton - /lib/ld-linux.so.2 and libvulkan on LD_LIBRARY_PATH
  amethyst = pkgs.symlinkJoin {
    name = "amethyst-mod-manager-wrapped";
    paths = [ amethyst-unwrapped ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      rm $out/bin/amethyst-mod-manager
      makeWrapper ${pkgs.steam-run}/bin/steam-run $out/bin/amethyst-mod-manager \
        --add-flags ${amethyst-unwrapped}/bin/amethyst-mod-manager \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ pkgs.vulkan-loader ]} \
        --unset LD_AUDIT
    '';
  };

  # lsfg-vk-cli = inputs.lsfg-vk.packages.${pkgs.system}.lsfg-vk-cli;
  # lsfg-vk-ui = inputs.lsfg-vk.packages.${pkgs.system}.lsfg-vk-ui;
in
{
  environment.systemPackages = [
    accela
    amethyst
    # lsfg-vk-cli
    # lsfg-vk-ui
    pkgs.heroic
    pkgs.protontricks
    pkgs.mangohud
    pkgs.protonup-qt
  ];

  # services.lsfg-vk = {
  #   enable = true;
  #   ui.enable = true;
  # };

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
