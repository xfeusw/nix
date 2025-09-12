# home/xfeusw/home.nix
{ plasma-manager, nur, ... }:
{
  home = {
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Import modular configurations
  imports = [
    plasma-manager.homeModules.plasma-manager
    nur.hmModules.nur
    ./development
    ./desktop
    ./shell
    ./applications
    ./git.nix
  ];
}
