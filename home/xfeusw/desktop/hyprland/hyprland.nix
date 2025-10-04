# home/xfeusw/desktop/hyprland/hyprland.nix
{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      # Monitor configuration
      monitor = ",preferred,auto,1";

      # Autostart
      exec-once = [
        "waybar"
        "mako"
        "hyprpaper"
        "nm-applet"
        "blueman-applet"
      ];

      # Input configuration
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle,caps:escape";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };

        sensitivity = 0;
      };

      # General settings - optimized for performance
      general = {
        gaps_in = 3;           # Reduced from 5
        gaps_out = 6;          # Reduced from 10
        border_size = 0;       # Removed borders

        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration - optimized for performance
      decoration = {
        rounding = 0;          # Removed border radius

        blur = {
          enabled = false;     # Disabled blur for better performance
        };

        shadow = {
          enabled = false;     # Disabled shadows for better performance
        };
      };

      # Animations - faster and more responsive
      animations = {
        enabled = true;

        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];

        animation = [
          "windows, 1, 4, overshot, slide"           # Faster: 7 -> 4
          "windowsOut, 1, 4, smoothOut, slide"       # Faster: 7 -> 4
          "border, 1, 6, default"                    # Faster: 10 -> 6
          "fade, 1, 4, smoothIn"                     # Faster: 7 -> 4
          "workspaces, 1, 4, default"                # Faster: 6 -> 4
        ];
      };

      # Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # Gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      # Miscellaneous - performance optimizations
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
        vrr = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      # Key bindings
      "$mod" = "SUPER";

      bind = [
        # Applications
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, nautilus"
        "$mod, V, togglefloating,"
        "$mod, D, exec, wofi --show drun"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"
        "$mod, F, fullscreen,"

        # Move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Vim-style focus movement
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Screenshot
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "SHIFT, Print, exec, grim - | wl-copy"
      ];

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Window rules for better performance
      windowrulev2 = [
        "immediate, class:^(cs2)$"
        "immediate, class:^(steam_app).*"
      ];
    };
  };
}
