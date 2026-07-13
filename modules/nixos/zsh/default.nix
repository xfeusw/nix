{ config, pkgs, ... }:
{
  programs.zsh.shellAliases = {
    zed = "zeditor";
    home = "cd ~";
  };
}
