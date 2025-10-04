{ ... }:
{
  services.mako = {
    enable = true;

    # Some options like timeout may not be recognized, so we set inside settings
    settings = {
      # Display behavior
      layer = "overlay";
      anchor = "top-right";
      font = "JetBrainsMono Nerd Font 11";
      output = "primary";
      icons = true;
      max-icon-size = 64;
      group-by = "app-name";

      # Visuals — darker, more contrasty look
      background-color = "#11111b"; # darker than Catppuccin base
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
      border-size = 2;
      border-radius = 12; # gives nice rounded edges
      width = 320;
      height = 160;
      padding = "12,16";
      margin = "10,10,0,0";
      progress-color = "#89b4fa";
      text-alignment = "left";

      # Timing (this one actually works in new mako versions)
      default-timeout = 4000;

      # Urgency levels
      "urgency=low" = {
        border-color = "#6c7086";
        default-timeout = 2000;
      };
      "urgency=normal" = {
        border-color = "#89b4fa";
        default-timeout = 5000;
      };
      "urgency=high" = {
        border-color = "#f38ba8";
        background-color = "#181825";
        default-timeout = 8000;
      };
    };
  };
}
