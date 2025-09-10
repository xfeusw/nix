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
    xclip
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
  ];
}
