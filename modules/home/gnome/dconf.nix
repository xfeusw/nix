{pkgs, ...}: let
  wallpaper = builtins.fetchUrl {
    url = "https://github.com/xfeusw/nix/blob/master/wallpapers/133.jpg";
    hash = "#";
  };
in {
  enable = true;
  settings = {
    "org/gnome/shell" = {
      disable-user-extensions = "false";
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator
        bluetooth-quick-connect
        blur-my-shell
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

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 0;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };

    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
      picture-uri-dark = wallpaper;
    };

    # "org/gnome/"
  };
}
