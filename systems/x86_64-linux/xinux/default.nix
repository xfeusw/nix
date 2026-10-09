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

  environment.systemPackages = with pkgs; [
    # Xeonitte
    inputs.xeonitte.packages.${pkgs.system}.default

    # Installer / partitioning UX
    calamares-nixos
    calamares-nixos-extensions

    gparted
    kdePackages.partitionmanager

    # Installer tooling / supporting UI
    polkit
    pkexec
  ];

  environment.etc."xeonitte".source = "${inputs.xeonitte}/result/etc/xeonitte";

  security.sudo-rs.enable = false;

  networking.networkmanager.enable = true;

  isoImage.volumeID = "XINUX";

  system.stateVersion = "26.11";
}
