{
  "$mod" = "SUPER";

  bind = [
    # Applications
    "$mod, Return, exec, ghostty"
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

    # Special workspace
    "$mod, S, togglespecialworkspace, magic"
    "$mod SHIFT, S, movetoworkspace, special:magic"

    # Scroll through workspaces
    "$mod, mouse_down, workspace, e+1"
    "$mod, mouse_up, workspace, e-1"

    # Screenshot
    ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
    "SHIFT, Print, exec, grim - | wl-copy"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];
}
