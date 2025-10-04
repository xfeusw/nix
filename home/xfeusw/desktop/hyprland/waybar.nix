# home/xfeusw/desktop/hyprland/waybar.nix
{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];

        # Workspaces
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        # Window title
        "hyprland/window" = {
          format = "{}";
          max-length = 50;
        };

        # Clock
        clock = {
          interval = 1;
          format = "{:%H:%M:%S}";
          format-alt = "{:%A, %B %d, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        # CPU
        cpu = {
          interval = 2;
          format = " {usage}%";
          tooltip = true;
        };

        # Memory
        memory = {
          interval = 5;
          format = " {}%";
          tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G";
        };

        # Battery
        battery = {
          interval = 10;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        # Network
        network = {
          interval = 5;
          format-wifi = " {essid}";
          format-ethernet = " Connected";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname}: {ipaddr}";
        };

        # PulseAudio
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        # System tray
        tray = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: JetBrains Mono;
        font-size: 13px;
      }

      window#waybar {
        background-color: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 10px;
        color: #cdd6f4;
        background: transparent;
        border: none;
      }

      #workspaces button.active {
        background-color: rgba(137, 180, 250, 0.3);
      }

      #workspaces button:hover {
        background-color: rgba(137, 180, 250, 0.2);
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 10px;
      }

      #battery.charging {
        color: #a6e3a1;
      }

      #battery.warning:not(.charging) {
        color: #fab387;
      }

      #battery.critical:not(.charging) {
        color: #f38ba8;
      }

      #cpu {
        color: #f9e2af;
      }

      #memory {
        color: #f5c2e7;
      }

      #network {
        color: #89b4fa;
      }

      #pulseaudio {
        color: #cba6f7;
      }

      #clock {
        color: #89dceb;
        font-weight: bold;
      }
    '';
  };
}
