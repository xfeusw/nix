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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  imports = [
    nur.modules.homeManager.default
    ./development
    ./desktop/hyprland
    ./shell
    ./applications
    ./git.nix
  ];
}
