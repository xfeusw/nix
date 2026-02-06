{
  # Window management
  "Mod+T".action.spawn = ["ghostty"];
  "Mod+D".action.spawn = ["fuzzel"];
  "Mod+Q".action.close-window = {};
  "Mod+E".action.spawn = ["nautilus"];
  "Mod+B".action.spawn = ["firefox"];
  "Mod+F".action.fullscreen-window = {};
  "Mod+M".action.maximize-column = {};

  # Screenshots
  "Print".action.screenshot-screen = {};
  "Mod+Shift+Alt+S".action.screenshot-window = {};
  "Mod+Shift+S".action.screenshot = {};

  # Screen recording
  "Mod+R".action.spawn = [
    "wf-recorder"
    "-g"
    "$(slurp)"
    "-f"
    "~/Videos/$(date +%Y-%m-%d_%H-%M-%S).mp4"
  ];

  # Lock screen
  "Mod+L".action.spawn = ["swaylock"];

  # Color picker
  "Mod+P".action.spawn = [
    "hyprpicker"
    "-a"
  ];

  # System Control
  "XF86AudioRaiseVolume".action.spawn = [
    "pactl"
    "set-sink-volume"
    "@DEFAULT_SINK@"
    "+5%"
  ];
  "XF86AudioLowerVolume".action.spawn = [
    "pactl"
    "set-sink-volume"
    "@DEFAULT_SINK@"
    "-5%"
  ];
  "XF86AudioMute".action.spawn = [
    "pactl"
    "set-sink-mute"
    "@DEFAULT_SINK@"
    "toggle"
  ];
  "XF86AudioMicMute".action.spawn = [
    "pactl"
    "set-source-mute"
    "@DEFAULT_SOURCE@"
    "toggle"
  ];
  "XF86AudioPlay".action.spawn = [
    "playerctl"
    "play-pause"
  ];
  "XF86AudioNext".action.spawn = [
    "playerctl"
    "next"
  ];
  "XF86AudioPrev".action.spawn = [
    "playerctl"
    "previous"
  ];
  "XF86MonBrightnessUp".action.spawn = [
    "brightnessctl"
    "set"
    "+5%"
  ];
  "XF86MonBrightnessDown".action.spawn = [
    "brightnessctl"
    "set"
    "5%-"
  ];

  # Workspaces - Focus
  "Mod+1".action.focus-workspace = 1;
  "Mod+2".action.focus-workspace = 2;
  "Mod+3".action.focus-workspace = 3;
  "Mod+4".action.focus-workspace = 4;
  "Mod+5".action.focus-workspace = 5;
  "Mod+6".action.focus-workspace = 6;
  "Mod+7".action.focus-workspace = 7;
  "Mod+8".action.focus-workspace = 8;
  "Mod+9".action.focus-workspace = 9;
  "Mod+Up".action.focus-workspace-up = {};
  "Mod+Down".action.focus-workspace-down = {};

  # Workspaces - Move window to workspace
  "Mod+Shift+1".action.move-window-to-workspace = 1;
  "Mod+Shift+2".action.move-window-to-workspace = 2;
  "Mod+Shift+3".action.move-window-to-workspace = 3;
  "Mod+Shift+4".action.move-window-to-workspace = 4;
  "Mod+Shift+5".action.move-window-to-workspace = 5;
  "Mod+Shift+6".action.move-window-to-workspace = 6;
  "Mod+Shift+7".action.move-window-to-workspace = 7;
  "Mod+Shift+8".action.move-window-to-workspace = 8;
  "Mod+Shift+9".action.move-window-to-workspace = 9;
  "Mod+Shift+Up".action.move-workspace-up = {};
  "Mod+Shift+Down".action.move-workspace-down = {};

  # Windows - Focus
  "Mod+Left".action.focus-column-left = {};
  "Mod+Right".action.focus-column-right = {};

  # Windows - Move
  "Mod+Shift+Left".action.move-column-left = {};
  "Mod+Shift+Right".action.move-column-right = {};
  "Mod+Shift+H".action.move-column-left = {};
  "Mod+Shift+L".action.move-column-right = {};
  "Mod+Shift+J".action.move-window-down = {};
  "Mod+Shift+K".action.move-window-up = {};

  # Window resizing
  "Mod+Ctrl+Left".action.set-column-width = "-10%";
  "Mod+Ctrl+Right".action.set-column-width = "+10%";
  "Mod+Ctrl+Up".action.set-window-height = "+10%";
  "Mod+Ctrl+Down".action.set-window-height = "-10%";
  "Mod+Ctrl+H".action.set-column-width = "-10%";
  "Mod+Ctrl+L".action.set-column-width = "+10%";
  "Mod+Ctrl+K".action.set-window-height = "+10%";
  "Mod+Ctrl+J".action.set-window-height = "-10%";

  # Reset window size
  # "Mod+R".action.reset-window-height = {};

  # Toggle floating
  "Mod+Shift+F".action.toggle-window-floating = {};

  # Center window
  "Mod+C".action.center-column = {};

  # System
  "Mod+Shift+E".action.quit = {};
  "Mod+Shift+R".action.spawn = [
    "niri"
    "msg"
    "action"
    "reload-config"
  ];

  # Alt bindings
  "Super+Shift+E".action.quit = {};
}
