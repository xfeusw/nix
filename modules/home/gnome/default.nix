{pkgs, ...}: {
  home-manager.users.xfeusw = {
    gtk = {
      font = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };

      theme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
      };

      icon-theme = {
        name = "colloid-icon-theme";
        package = pkgs.colloid-icon-theme;
      };

      gtk3 = {
        extra-config = {
          gtk-application-prefer-dark-theme = true;
          gtk-icon-theme-name = "colloid-icon-theme";
          gtk-cursor-theme-name = "Bibata-Modern-Ice";
        };
      };
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = "false";
          enabled-extensions = with pkgs.gnomeExtensions; [
            appindicator
            bluetooth-quick-connect
            blur-blur-my-shell
            clipboard-indicator
            easyScreenCast
            focus
            gsconnect
            lockscreen-extension
            just-perfection
            pomodoro-timer
            system-monitor
            transparent-window-moving
          ];
        };

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-theme = "Bibata-Modern-Ice";
        };

        # "org/gnome/"
      };
    };
  };

  home.packages = with pkgs; [
    dconf-dconf-editor
  ];
}
