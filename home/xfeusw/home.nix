{
  nur,
  pkgs,
  lib,
  niri,
  ...
}: {
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

  xdg.enable = true;
  xdg.systemDirs.data = [
    "/run/current-system/sw/share"
    "/usr/share"
    "/usr/local/share"
  ];
  xdg.userDirs.enable = true;

  home.sessionVariables = lib.mkForce {
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$HOME/.local/share:/run/current-system/sw/share:/usr/share:/usr/local/share";
  };

  # Ensure plasma can find home-manager applications
  home.file.".config/plasma-workspace/env/home-manager-paths.sh".text = ''
    export XDG_DATA_DIRS="$HOME/.nix-profile/share:$HOME/.local/share:$XDG_DATA_DIRS"
  '';

  imports = [
    nur.modules.homeManager.default
    ./development
    ./desktop
    ./shell
    ./applications
    ./git.nix
  ];
}
