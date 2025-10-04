# ~/.config/nix/wofi/default.nix
{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = import ./settings.nix;
    style = builtins.readFile ./style.css;
  };

  home.packages = [
    (pkgs.writeShellScriptBin "power-menu" (builtins.readFile ../scripts/power-menu.sh))
    (pkgs.writeShellScriptBin "emoji-picker" (builtins.readFile ../scripts/emoji-picker.sh))
  ];
}
