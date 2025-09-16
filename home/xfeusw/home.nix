# home/xfeusw/home.nix
{ nur, ... }:
{
  home = {
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
    # activation.backupFileExtension = "backup";
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Import modular configurations
  imports = [
    nur.modules.homeManager.default
    ./development
    ./desktop
    ./shell
    ./applications
    ./git.nix
  ];
}
