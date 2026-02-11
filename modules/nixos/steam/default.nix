{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    proton-ge-bin
    mangohud
    protonup-qt
    lutris
    bottles
    heroic
  ];
}
