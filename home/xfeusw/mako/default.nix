{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    # Appearance - Tokyo Night
    backgroundColor = "#1a1b26";
    textColor = "#a9b1d6";
    borderColor = "#7aa2f7";
    borderSize = 2;
    borderRadius = 10;

    # Dimensions
    width = 400;
    height = 150;
    margin = "20";
    padding = "15";

    # Behavior
    defaultTimeout = 5000;
    ignoreTimeout = false;

    # Position
    anchor = "top-right";

    # Font
    font = "monospace 11";

    # Icons
    icons = true;
    maxIconSize = 48;
    iconPath = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";

    # Grouping
    groupBy = "app-name";

    # Progress bar
    progressColor = "over #24283b";

    # Urgency levels
    extraConfig = ''
      [urgency=low]
      border-color=#9ece6a
      default-timeout=3000

      [urgency=normal]
      border-color=#7aa2f7
      default-timeout=5000

      [urgency=high]
      border-color=#f7768e
      default-timeout=0

      [app-name=volume]
      border-color=#9ece6a
      default-timeout=2000

      [app-name=brightness]
      border-color=#e0af68
      default-timeout=2000
    '';
  };
}
