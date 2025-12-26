{pkgs, ...}: {
  imports = [./dconf.nix];

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
}
