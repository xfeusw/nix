{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = ["niri/workspaces" "niri/window"];
        modules-center = ["clock" "date"];
        modules-right = ["cpu" "memory" "pulseaudio" "network" "battery" "tray"];

        "wlr/workspaces" = {
          format = "{index}";
          all-outputs = true;
          # 💡 Scrollable Workspaces Enhancement
          on-scroll-up = "niri msg action focus-workspace-up";
          on-scroll-down = "niri msg action focus-workspace-down";
        };

        "niri/window" = {
          format = " {title}";
          max-length = 40;
          rewrite = {
            "" = "  No Active Window";
          };
        };

        clock = {
          format = "{:%I:%M %p}";
          format-alt = "{:%Y-%m-%d %I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        date = {
          format = " {:%a, %b %d}";
          tooltip-format = "{:%A, %B %d, %Y}";
        };

        cpu = {
          format = "CPU {usage}%";
          tooltip = true;
        };

        memory = {
          format = "RAM {used:0.1f}G/{total:0.1f}G";
          tooltip = true;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ⚡";
          format-icons = ["" "" "" "" ""];
          tooltip-format = "{timeTo} ({capacity}%)";
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) 📶";
          format-ethernet = "Ethernet ";
          format-disconnected = "Disconnected ";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}  {bandwidthDownBits}  {bandwidthUpBits}";
          states = {
            disconnected = 0;
            low = 10;
          };
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "Muted 🔇";
          format-icons = {
            default = ["" "" ""];
          };
          # 💡 Scrollable Audio Enhancement
          tooltip = true;
          tooltip-format = "Volume: {volume}%";
          scroll-step = 5;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        };
      };
    };
    style = builtins.readFile ./style.css;
  };

  # Autostart Waybar via systemd service (assuming this is correct)
  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar status bar";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 3;
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
