{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri.overlays.niri];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;

    settings = {
      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:alt_shift_toggle";
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
        };
        mouse = {
          accel-profile = "flat";
          accel-speed = 0.0;
        };
        tablet = {
          map-to-output = "eDP-1";
        };
      };

      layout = {
        gaps = 1;
        border = {
          width = 0;
          active.color = "#7aa2f7";
          inactive.color = "#414868";
        };
        focus-ring = {
          width = 0;
          active.color = "#7aa2f7";
          inactive.color = "#414868";
        };
      };

      prefer-no-csd = true;

      window-rules = [
        {
          matches = [{app-id = "^dev\\.zed\\.Zed$";}];
          default-column-width = {};
        }
      ];

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      # Spawn services at startup
      spawn-at-startup = [
        # { command = ["swaybg" "-m" "fill" "-i" "../../../wallpapers/elizabeth.jpg"]; }
        # { command = ["swayidle" "-w"]; }
        {command = ["mako"];}
      ];

      binds = {
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

        # Lock Screen
        "Mod+Alt+L".action.spawn = ["loginctl" "lock-session"];

        # Power off monitors
        "Mod+Shift+P".action.power-off-monitors = {};

        # Focus navigation
        "Mod+H".action.focus-column-left = {};
        "Mod+L".action.focus-column-right = {};
        "Mod+K".action.focus-window-up = {};
        "Mod+J".action.focus-window-down = {};
        "Mod+Left".action.focus-column-left = {};
        "Mod+Right".action.focus-column-right = {};
        "Mod+Up".action.focus-window-up = {};
        "Mod+Down".action.focus-window-down = {};

        # Move windows
        "Mod+Shift+H".action.move-column-left = {};
        "Mod+Shift+L".action.move-column-right = {};
        "Mod+Shift+K".action.move-window-up = {};
        "Mod+Shift+J".action.move-window-down = {};
        "Mod+Shift+Left".action.move-column-left = {};
        "Mod+Shift+Right".action.move-column-right = {};
        "Mod+Shift+Up".action.move-window-up = {};
        "Mod+Shift+Down".action.move-window-down = {};

        # Resize windows
        "Mod+Ctrl+H".action.set-column-width = "-10%";
        "Mod+Ctrl+L".action.set-column-width = "+10%";
        "Mod+Ctrl+K".action.set-window-height = "-10%";
        "Mod+Ctrl+J".action.set-window-height = "+10%";

        # Workspaces - Focus
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;

        # Workspaces - Move window to workspace
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;

        # System
        "Mod+Shift+E".action.quit = {};
        "Mod+Shift+R".action.spawn = ["niri" "msg" "action" "reload-config"];

        # Alt bindings
        "Super+Shift+E".action.quit = {};
        "Alt+Q".action.close-window = {};
        "Alt+H".action.focus-column-left = {};
        "Alt+Shift+H".action.move-column-left = {};
        "Alt+Shift+L".action.move-column-right = {};
        "Alt+M".action.maximize-column = {};
        "Alt+B".action.spawn = ["firefox"];
        "Alt+D".action.spawn = ["fuzzel"];
        "Alt+Return".action.spawn = ["ghostty"];
        "Alt+Shift+R".action.spawn = ["niri" "msg" "action" "reload-config"];

        # Screenshot to clipboard
        "Print".action.spawn = ["sh" "-c" "grim - | wl-copy"];

        # Screenshot to file
        "Mod+Print".action.spawn = ["sh" "-c" "grim ~/Pictures/Screenshots/Screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"];

        # Screen recording with audio
        "Mod+Shift+Print".action.spawn = ["sh" "-c" "if pgrep wf-recorder; then pkill wf-recorder; else wf-recorder -a -f ~/Videos/Recordings/Recording-$(date +%Y-%m-%d-%H-%M-%S).mp4; fi"];
      };

      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 21;
      };

      environment = {
        XCURSOR_THEME = "Bibata-Modern-Ice";
        XCURSOR_SIZE = "21";
      };
    };
  };
}
