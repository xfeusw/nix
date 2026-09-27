# This iso is used for testing Xeonitte
{
  config,
  pkgs,
  inputs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-graphical-gnome.nix")
  ];

  environment.systemPackages = [
    inputs.xeonitte.packages.${pkgs.system}.default
  ];

  environment.etc."xeonitte".source = "${inputs.xeonitte}/result/etc/xeonitte";

  security.sudo-rs.enable = false;

  networking.networkmanager.enable = true;

  isoImage.volumeID = "XINUX";

  system.stateVersion = "26.11";
}
