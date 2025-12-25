{
  pkgs,
  inputs,
  ...
}: let
  # wallpaper = ../../../wallpapers/133.jpg;
  wallpaper = builtins.fetchUrl {
    url = "https://github.com/xfeusw/nix/blob/master/wallpapers/133.jpg";
    hash = "#";
  };
in {
  imports = [inputs.niri.homeModules.niri];

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
        tablet = {
          map-to-output = "eDP-1";
        };
      };
      layout = {
        background-color = "#00000000";
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
        # {
        # open-maximized = true;
        # }
      ];
      # Spawn services at startup
      spawn-at-startup = [
        {argv = ["waybar"];}
        {argv = ["mako"];}
        {argv = ["swaybg" "--image" "${wallpaper}"];}
      ];

      # Import binds from separate file
      binds = import ./binds.nix;

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
