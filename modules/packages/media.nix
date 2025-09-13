# modules/packages/media.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Media and graphics
    vlc
    mpv
    gimp
    inkscape
    obs-studio
  ];
}
