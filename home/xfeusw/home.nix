{nur, ...}: {
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
  xdg.systemDirs.data = ["/run/current-system/sw/share"];
  xdg.userDirs.enable = true;

  home.sessionVariables = {
    XDG_DATA_DIRS = "${pkgs.lib.concatStringsSep ":" [
      "$HOME/.nix-profile/share"
      "$HOME/.local/share"
      "/run/current-system/sw/share"
      "/usr/share"
    ]}";
  };

  imports = [
    nur.modules.homeManager.default
    ./development
    ./desktop
    ./shell
    ./applications
    ./git.nix
  ];
}
