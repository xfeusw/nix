{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      # Appearance - Tokyo Night
      background-color = "#1a1b26";
      text-color = "#a9b1d6";
      border-color = "#7aa2f7";
      border-size = 2;
      border-radius = 10;

      # Dimensions
      width = 400;
      height = 150;
      margin = "20";
      padding = "15";

      # Behavior
      default-timeout = 5000;
      ignore-timeout = false;

      # Position
      anchor = "top-right";

      # Font
      font = "monospace 11";

      # Icons
      icons = true;
      max-icon-size = 48;
      icon-path = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";

      # Grouping
      group-by = "app-name";

      # Progress bar
      progress-color = "over #24283b";

      # Urgency levels
      urgency-low = {
        border-color = "#9ece6a";
        default-timeout = 3000;
      };

      urgency-normal = {
        border-color = "#7aa2f7";
        default-timeout = 5000;
      };

      urgency-high = {
        border-color = "#f7768e";
        default-timeout = 0;
      };

      # App-specific rules
      "app-name=volume" = {
        border-color = "#9ece6a";
        default-timeout = 2000;
      };

      "app-name=brightness" = {
        border-color = "#e0af68";
        default-timeout = 2000;
      };
    };
  };
}
