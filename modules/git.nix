{ config, pkgs, ... }:

{
  # Install Git system-wide
  environment.systemPackages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "khamrakulovkamron@gmail.com";
  };
}
