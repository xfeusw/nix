{ config, lib, pkgs, ... }:

{
  services.openssh.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
} 