# modules/services.nix
{ config, lib, pkgs, ... }:

{
  # SSH server
  services.openssh.enable = true;

  # Tools
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
} 