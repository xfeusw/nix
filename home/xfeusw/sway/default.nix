{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./sway.nix
    ./swayidle.nix
    ./swaylock.nix
  ];
}
