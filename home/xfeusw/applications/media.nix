# home/xfeusw/applications/media.nix
{ pkgs, unstable, ... }:
{
  home.packages =
    with pkgs;
    [
      # Music and video
      spotify
      vlc
      mpv

      # Graphics
      gimp
      inkscape
      krita

      # Photography
      darktable

      # Screen recording
      obs-studio

      # Audio editing
      audacity

      # Video editing
      kdenlive
    ]
    ++ (with unstable; [
      # Add unstable media packages here if needed
    ]);
}
