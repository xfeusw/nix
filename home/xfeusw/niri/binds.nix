{
  # Window management
  "Mod+Return".action.spawn = ["ghostty"];
  "Mod+D".action.spawn = ["fuzzel"];
  "Mod+Q".action.close-window = {};
  "Mod+E".action.spawn = ["dolphin"];
  "Mod+B".action.spawn = ["firefox"];
  "Mod+F".action.fullscreen-window = {};
  "Mod+M".action.maximize-column = {};

  # System Control
  "XF86AudioRaiseVolume".action.spawn = ["pactl" "set-sink-volume" "@DEFAULT_SINK@" "+5%"];
  "XF86AudioLowerVolume".action.spawn = ["pactl" "set-sink-volume" "@DEFAULT_SINK@" "-5%"];
  "XF86AudioMute".action.spawn = ["pactl" "set-sink-mute" "@DEFAULT_SINK@" "toggle"];
  "XF86AudioPlay".action.spawn = ["playerctl" "play-pause"];
  "XF86MonBrightnessUp".action.spawn = ["brightnessctl" "set" "+5%"];
  "XF86MonBrightnessDown".action.spawn = ["brightnessctl" "set" "5%-"];

  # Workspaces - Focus
  "Mod+1".action.focus-workspace = 1;
  "Mod+2".action.focus-workspace = 2;
  "Mod+3".action.focus-workspace = 3;
  "Mod+4".action.focus-workspace = 4;
  "Mod+5".action.focus-workspace = 5;
  "Mod+Up".action.focus-workspace-up = {};
  "Mod+Down".action.focus-workspace-down = {};

  # Workspaces - Move window to workspace
  "Mod+Shift+1".action.move-window-to-workspace = 1;
  "Mod+Shift+2".action.move-window-to-workspace = 2;
  "Mod+Shift+3".action.move-window-to-workspace = 3;
  "Mod+Shift+4".action.move-window-to-workspace = 4;
  "Mod+Shift+5".action.move-window-to-workspace = 5;
  "Mod+Shift+Up".action.move-workspace-up = {};
  "Mod+Shift+Down".action.move-workspace-down = {};

  # Windows - Focus
  "Mod+Left".action.focus-column-left = {};
  "Mod+Right".action.focus-column-right = {};

  # Windows - Move
  "Mod+Shift+Left".action.move-column-left = {};
  "Mod+Shift+Right".action.move-column-right = {};

  # System
  "Mod+Shift+E".action.quit = {};

  # Alt bindings
  "Super+Shift+E".action.quit = {};
}
