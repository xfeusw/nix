{ pkgs, lib, ... }:
let
  inherit (lib.gvariant) mkInt32 mkDouble;

  extensions = with pkgs.gnomeExtensions; [
    appindicator
    auto-move-windows
    blur-my-shell
    clipboard-indicator
    dash-to-dock
    impatience
    just-perfection
    runcat
    transparent-window-moving
  ];

  wallpaper = ../../../wallpapers/chair-under-neon-lights.jpg;
in
{
  home.packages = extensions;

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
      };

      "org/gnome/shell/extensions/appindicator" = {
        icon-brightness = mkDouble 0.0;
        icon-contrast = mkDouble 0.0;
        icon-opacity = mkInt32 240;
        icon-saturation = mkDouble 0.0;
        icon-size = mkInt32 0;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        always-center-icons = true;
        apply-custom-theme = false;
        background-color = "rgb(0,0,0)";
        background-opacity = mkDouble 0.39;
        click-action = "launch";
        custom-background-color = true;
        custom-theme-shrink = true;
        dash-max-icon-size = mkInt32 24;
        dock-position = "BOTTOM";
        extend-height = true;
        height-fraction = mkDouble 0.87;
        icon-size-fixed = true;
        intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
        isolate-workspaces = true;
        max-alpha = mkDouble 0.8;
        multi-monitor = true;
        running-indicator-dominant-color = true;
        running-indicator-style = "CILIORA";
        scroll-action = "switch-workspace";
        transparency-mode = "FIXED";
      };

      "org/gnome/shell/extensions/net/gfxmonk/impatience" = {
        speed-factor = mkDouble 0.5;
      };

      "org/gnome/shell/extensions/runcat" = {
        custom-system-monitor-command = "resources";
        custom-system-monitor-enabled = true;
        displaying-items = "character-and-percentage";
        idle-threshold = mkInt32 20;
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        pipelines =
          with lib.gvariant;
          mkArray [
            (mkDictionaryEntry "pipeline_default" (mkArray [
              (mkDictionaryEntry "name" (mkVariant "Default"))
              (mkDictionaryEntry "effects" (
                mkVariant (mkArray [
                  (mkVariant (mkArray [
                    (mkDictionaryEntry "type" (mkVariant "luminosity"))
                    (mkDictionaryEntry "id" (mkVariant "effect_24936439677212"))
                    (mkDictionaryEntry "params" (
                      mkVariant (mkArray [
                        (mkDictionaryEntry "contrast_center" (mkVariant (mkDouble 0.5)))
                        (mkDictionaryEntry "brightness_shift" (mkVariant (mkDouble (-0.1))))
                      ])
                    ))
                  ]))
                ])
              ))
            ]))

            (mkDictionaryEntry "pipeline_default_rounded" (mkArray [
              (mkDictionaryEntry "name" (mkVariant "Default rounded"))
              (mkDictionaryEntry "effects" (
                mkVariant (mkArray [
                  (mkVariant (mkArray [
                    (mkDictionaryEntry "type" (mkVariant "luminosity"))
                    (mkDictionaryEntry "id" (mkVariant "effect_31384154838796"))
                    (mkDictionaryEntry "params" (
                      mkVariant (mkEmptyArray (type.dictionaryEntryOf type.string type.variant))
                    ))
                  ]))

                  (mkVariant (mkArray [
                    (mkDictionaryEntry "type" (mkVariant "corner"))
                    (mkDictionaryEntry "id" (mkVariant "effect_000000000002"))
                    (mkDictionaryEntry "params" (
                      mkVariant (mkArray [
                        (mkDictionaryEntry "radius" (mkVariant (mkInt32 24)))
                      ])
                    ))
                  ]))
                ])
              ))
            ]))
          ];

        rounded-blur-found = false;
        settings-version = mkInt32 2;
      };

      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
        brightness = mkInt32 0.6;
        sigma = mkInt32 30;
      };

      "org/gnome/shell/extensions/blur-my-shell/applications" = {
        blacklist = [
          "Plank"
          "com.desktop.ding"
          "Conky"
        ];
        blur = true;
        blur-on-overview = true;
        brightness = mkDouble 0.68;
        corner-when-maximized = false;
        dynamic-opacity = false;
        enable-all = true;
        opacity = mkInt32 199;
        pipeline = "pipeline_default";
        sigma = mkInt32 25;
        static-blur = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = true;
        brightness = mkDouble 0.6;
        override-background = false;
        pipeline = "pipeline_default_rounded";
        sigma = mkInt32 30;
        static-blur = true;
        style-dash-to-dock = mkInt32 0;
      };

      "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/overview" = {
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        brightness = mkDouble 0.6;
        corner-radius = mkInt32 0;
        pipeline = "pipeline_default";
        sigma = mkInt32 30;
      };

      "org/gnome/shell/extensions/blur-my-shell/window-list" = {
        brightness = mkDouble 0.6;
        sigma = mkInt32 30;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        accessibility-menu = true;
        activities-button = true;
        background-menu = true;
        clock-menu = true;
        controls-manager-spacing-size = mkInt32 0;
        dash = true;
        dash-app-running = true;
        dash-icon-size = mkInt32 0;
        dash-separator = true;
        double-super-to-appgrid = true;
        keyboard-layout = true;
        osd = true;
        panel = true;
        panel-in-overview = true;
        quick-settings = true;
        quick-settings-airplane-mode = true;
        quick-settings-do-not-disturb = true;
        ripple-box = true;
        search = true;
        show-apps-button = true;
        startup-status = mkInt32 1;
        theme = false;
        window-demands-attention-focus = false;
        window-picker-icon = true;
        window-preview-caption = true;
        window-preview-close-button = true;
        workspace = true;
        workspace-background-corner-size = mkInt32 0;
        workspace-popup = true;
        workspaces-in-app-grid = true;
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-format = "12h";
        # clock-show-seconds = true;
        toolbar-icons-size = "small";
        window-scaling-factor = 0;
        text-scaling-factor = 0.9;
      };

      "org/gnome/desktop/input-sources" = with lib.gvariant; {
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

      "org/gnome/desktop/background" = {
        picture-uri = "${wallpaper}";
        picture-uri-dark = "${wallpaper}";
      };
    };
  };
}
