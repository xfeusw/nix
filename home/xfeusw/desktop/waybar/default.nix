# home/xfeusw/desktop/hyprland/waybar.nix
{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 6;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "battery"
          "tray"
        ];

        # Workspaces
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "active" = "";
            "default" = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        # Window title
        "hyprland/window" = {
          format = "{}";
          max-length = 60;
          separate-outputs = true;
        };

        # Idle inhibitor
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
          tooltip-format-activated = "Idle inhibitor: ON";
          tooltip-format-deactivated = "Idle inhibitor: OFF";
        };

        # Clock with calendar
        clock = {
          interval = 1;
          format = "{:%H:%M:%S}";
          format-alt = "{:%A, %B %d, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#89b4fa'><b>{}</b></span>";
              days = "<span color='#cdd6f4'>{}</span>";
              today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
            };
          };
        };

        # CPU with states
        cpu = {
          interval = 2;
          format = "󰻠 {usage}%";
          format-alt = "󰻠 {avg_frequency}GHz";
          tooltip = true;
          states = {
            warning = 70;
            critical = 90;
          };
        };

        # Memory with tooltip
        memory = {
          interval = 5;
          format = "󰍛 {}%";
          format-alt = "󰍛 {used:0.1f}G/{total:0.1f}G";
          tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G ({percentage}%)\nSwap: {swapUsed:0.1f}G / {swapTotal:0.1f}G";
          states = {
            warning = 70;
            critical = 90;
          };
        };

        # Battery with detailed info
        battery = {
          interval = 10;
          states = {
            good = 80;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-full = "󱟢 Full";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip-format = "{timeTo}\nCapacity: {capacity}%\nHealth: {health}%";
        };

        # Network with bandwidth
        network = {
          interval = 3;
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈀 {ipaddr}";
          format-disconnected = "󰖪 Disconnected";
          format-alt = "󰇚 {bandwidthDownBytes} 󰕒 {bandwidthUpBytes}";
          tooltip-format = "{ifname} via {gwaddr}\n󰇚 {bandwidthDownBytes} 󰕒 {bandwidthUpBytes}\nSignal: {signalStrength}%";
          tooltip-format-disconnected = "Disconnected";
          on-click-right = "nm-connection-editor";
        };

        # PulseAudio enhanced
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          format-bluetooth = "󰂯 {volume}%";
          format-bluetooth-muted = "󰂯 󰝟";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "󰄜";
            portable = "󰄜";
            car = "󰄋";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          scroll-step = 5;
          on-click = "pavucontrol";
          on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          tooltip-format = "{desc}\nVolume: {volume}%";
        };

        # System tray
        tray = {
          icon-size = 18;
          spacing = 8;
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}
