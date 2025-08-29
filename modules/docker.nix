{ config, lib, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  users.users.xfeusw.extraGroups = [ "docker" "wheel" ];
} 