{pkgs, ...}: {
  gtk = {
    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    icontheme = {
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

  dconf = import ./dconf.nix;

  home.packages = with pkgs; [
    dconf-editor
  ];
}
