{ pkgs, ... }:
{
  imports = [
    ./dconf.nix
    # ./binds.nix
  ];

  gtk = {
    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
    };

    # iconTheme = {
    #   name = "papirus-icon-theme";
    #   package = pkgs.papirus-icon-theme;
    # };

    # gtk3 = {
    #   extra-config = {
    #     gtk-application-prefer-dark-theme = true;
    #     gtk-icon-theme-name = "colloid-icon-theme";
    #     gtk-cursor-theme-name = "Bibata-Modern-Ice";
    #   };
    # };
  };
}
