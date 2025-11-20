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
          accel-speed = 0.4;
        };
      };

      layout = {
        gaps = 1;
        border = {
          width = 2;
          active.color = "#7aa2f7";
          inactive.color = "#414868";
        };
        focus-ring = {
          width = 2;
          active.color = "#7aa2f7";
          inactive.color = "#414868";
        };
      };

      prefer-no-csd = true;

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
        "Mod+K".action.focus-workspace-up = {};
        "Mod+J".action.focus-workspace-down = {};
        "Mod+Left".action.focus-column-left = {};
        "Mod+Right".action.focus-column-right = {};
        "Mod+Up".action.focus-workspace-up = {};
        "Mod+Down".action.focus-workspace-down = {};

        # Move windows
        "Mod+Shift+H".action.move-column-left = {};
        "Mod+Shift+L".action.move-column-right = {};
        "Mod+Shift+K".action.move-workspace-up = {};
        "Mod+Shift+J".action.move-workspace-down = {};
        "Mod+Shift+Left".action.move-column-left = {};
        "Mod+Shift+Right".action.move-column-right = {};
        "Mod+Shift+Up".action.move-workspace-up = {};
        "Mod+Shift+Down".action.move-workspace-down = {};

        # Resize windows
        "Mod+Ctrl+H".action.set-column-width = "-10%";
        "Mod+Ctrl+L".action.set-column-width = "+10%";
        "Mod+Ctrl+K".action.set-window-height = "-10%";
        "Mod+Ctrl+J".action.set-window-height = "+10%";

        # Workspaces
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;

        # System
        "Mod+Shift+E".action.quit = {};
        "Mod+Shift+R".action.spawn = ["sh" "-c" "niri msg action quit; niri"];

        # Alt bindings
        "Super+Shift+E".action.spawn = ["sh" "-c" "niri msg action quit; niri"];
        "Alt+Q".action.close-window = {};
        "Alt+H".action.focus-column-left = {};
        "Alt+Shift+H".action.move-column-left = {};
        "Alt+Shift+L".action.move-column-right = {};
        "Alt+M".action.maximize-column = {};
        "Alt+B".action.spawn = ["firefox"];
        "Alt+D".action.spawn = ["fuzzel"];
        "Alt+Return".action.spawn = ["ghostty"];
        "Alt+Shift+R".action.spawn = ["sh" "-c" "niri msg action quit; niri"];

        # Screenshot to clipboard
        "Print".action.spawn = ["sh" "-c" "grim - | wl-copy"];

        # Screenshot to file
        "Mod+Print".action.spawn = ["sh" "-c" "grim ~/Pictures/Screenshots/Screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"];

        # Screen recording with audio
        "Mod+Shift+Print".action.spawn = ["sh" "-c" "if pgrep wf-recorder; then pkill wf-recorder; else wf-recorder -a -f ~/Videos/Recordings/Recording-$(date +%Y-%m-%d-%H-%M-%S).mp4; fi"];
      };

      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 22;
      };
    };
  };
}
