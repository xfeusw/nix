# modules/system-packages.nix
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gh
    home-manager
    docker-client
    docker-compose
  ];
}
