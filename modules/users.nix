{ config, lib, pkgs, ... }:

{
  users.users.xfeusw = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "1111";
  };
} 