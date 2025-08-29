{ config, lib, pkgs, ... }:

{
  users.users.xfeusw = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
      telegram-desktop
      zed-editor
      code-cursor
      vscode
      spotify
      yandex-music
      discord
      tor
      tor-browser
      brave
    ];
    initialPassword = "1111";
  };
} 