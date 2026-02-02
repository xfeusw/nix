{pkgs, ...}: let
  browser = "zen-twilight.desktop";
in {
  imports = [
    ./dconf.nix
    # ./binds.nix
  ];

  gtk = {
    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
    };

    iconTheme = {
      name = "colloid-icon-theme";
      package = pkgs.colloid-icon-theme;
    };

    # gtk3 = {
    #   extra-config = {
    #     gtk-application-prefer-dark-theme = true;
    #     gtk-icon-theme-name = "colloid-icon-theme";
    #     gtk-cursor-theme-name = "Bibata-Modern-Ice";
    #   };
    # };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
    };
  };
}
