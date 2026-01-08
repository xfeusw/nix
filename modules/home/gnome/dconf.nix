{
  pkgs,
  lib,
  wallpaper,
  ...
}: let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    bluetooth-quick-connect
    clipboard-indicator
    dash-to-dock
    easyScreenCast
    gsconnect
    lockscreen-extension
    just-perfection
    pomodoro-timer
    system-monitor
    transparent-window-moving
  ];
in {
  home.packages = with pkgs;
    [
      dconf-editor
      bibata-cursors
    ]
    ++ extensions;

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 22;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = map (ext: ext.extensionUuid) extensions;
        favorite-apps = [
          "org.telegram.desktop.desktop"
          # "blueman-manager.desktop"
          "spotify.desktop"
          "floorp.desktop"
          "dev.zed.Zed.desktop"
          "com.mitchellh.ghostty.desktop"
          # "code.desktop"
          # "android-studio.desktop"
        ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 30;
      };

      "org/gnome/shell/extensions/lockscreen-extension" = {
        user-background-1 = false;

        # Set custom wallpaper
        background-image-path-1 = "${wallpaper}";
        background-size-1 = "cover";

        # Blur settings
        blur-radius-1 = 30;
        blur-brightness-1 = 0.6;

        primary-color-1 = lib.mkForce ""; # Override any defaults
        gradient-direction-1 = "none";

        # Optional: hide the extension button
        hide-lockscreen-extension-button = true;
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-format = "12h";
        # clock-show-seconds = true;
        toolbar-icons-size = "small";
        window-scaling-factor = 0;
        text-scaling-factor = 0.9;
      };

      "org/gnome/desktop/input-sources" = with lib.hm.gvariant; {
        sources = [
          (mkTuple [
            "xkb"
            "us"
          ])
          (mkTuple [
            "xkb"
            "ru"
          ])
        ];
        xkb-options = ["grp:alt_shift_toggle"];
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

      "org/gnome/mutter" = {
        experimental-features = ["variable-refresh-rate"];
      };
    };
  };
}
