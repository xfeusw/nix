{
  pkgs,
  lib,
  wallpaper,
  ...
}:
let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    bluetooth-quick-connect
    clipboard-indicator
    dash-to-dock
    easyScreenCast
    # gsconnect
    # lockscreen-extension
    just-perfection
    # pomodoro-timer
    system-monitor
    transparent-window-moving
    runcat
    blur-my-shell
    copyous
    sound-output-device-chooser
    soundbar
    removable-drive-menu
    # coverflow-alt-tab
    # vitals
    launch-new-instance
    workspace-indicator
    auto-move-windows
    lock-keys-2
    tiling-shell
    # bluetooth-quick-connect
    impatience
  ];
in
{
  home.packages =
    with pkgs;
    [
      dconf-editor
      bibata-cursors
      gnome-extension-manager
    ]
    ++ extensions;

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 20;
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
          "element-desktop.desktop"
          # "blueman-manager.desktop"
          "spotify.desktop"
          "zen-beta.desktop"
          "dev.zed.Zed.desktop"
          "code.desktop"
          "com.mitchellh.ghostty.desktop"
          # "android-studio.desktop"
        ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 25;
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
          (mkTuple [
            "xkb"
            "de"
          ])
        ];
        xkb-options = [ "grp:win_space_toggle" ];
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
        experimental-features = [ "variable-refresh-rate" ];
      };
    };
  };
}
