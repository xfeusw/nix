{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./swayidle.nix
    ./swaylock.nix
  ];
}
