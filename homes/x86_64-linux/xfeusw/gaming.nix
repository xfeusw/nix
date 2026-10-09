{
  pkgs,
  config,
  inputs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  # home.file.".steam/root/compatibilitytools.d/GE-Proton11-1-LinUwUx-patch".source =
  #   inputs.linuwowo.packages.${system}.GE-Proton11-1-LinUwUx-patch;
}
