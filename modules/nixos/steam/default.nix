{
  pkgs,
  lib,
  ...
}:
{
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    steamcmd
    steam-run
    glibc
  ];

  programs.steam.enable = true;
}
