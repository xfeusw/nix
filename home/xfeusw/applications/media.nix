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
      gimp3-with-plugins

      # Screen recording
      obs-studio
    ]
    ++ (with unstable; [
      # Add unstable media packages here if needed
    ]);
}
