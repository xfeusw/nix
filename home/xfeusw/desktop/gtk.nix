# home/xfeusw/desktop/gtk.nix
{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      size = 24;
    };

    # gtk4.extraCss = ''
    #   headerbar {
    #     background: #2d2d2d;
    #     color: #ffffff;
    #   }

    #   headerbar button {
    #     background: transparent;
    #     color: #ffffff;
    #   }

    #   headerbar button:hover {
    #     background: rgba(255, 255, 255, 0.1);
    #   }
    # '';
  };
}
