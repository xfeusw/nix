{ nur, ... }:
{
  home = {
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  imports = [
    nur.modules.homeManager.default
    ./development
    ./desktop
    ./shell
    ./applications
    ./git.nix
  ];
}
