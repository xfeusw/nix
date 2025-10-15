# modules/packages/media.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    alsa-utils
  ];
}
