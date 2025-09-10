# home/xfeusw/home.nix
{
  ...
}:
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  # Fix version mismatch warning
  home.enableNixpkgsReleaseCheck = false;
  nixpkgs.config.allowUnfree = true;

  # Zed config mini
  nixGL.vulkan.enable = true;

  # Import modular configurations
  imports = [
    ./settings.nix
    ./packages.nix
    ./git.nix
    ./zsh.nix
  ];
}
