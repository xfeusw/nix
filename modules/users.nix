# modules/users.nix
{ pkgs, ... }:

{
  users.users.xfeusw = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "1111";
    shell = pkgs.zsh;
  };
}
