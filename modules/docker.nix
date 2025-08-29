{ config, lib, pkgs, ... }:

{
  # Docker daemon and group
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.xfeusw.extraGroups = [ "docker" "wheel" ];
} 