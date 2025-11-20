{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1a1b26";
      font = "Inter";
      font-size = 24;

      indicator-radius = 150;
      indicator-thickness = 20;
      indicator-idle-visible = true;

      key-hl-color = "7aa2f7";
      bs-hl-color = "f7768e";

      separator-color = "00000000";

      inside-color = "1a1b26";
      inside-clear-color = "1a1b26";
      inside-ver-color = "1a1b26";
      inside-wrong-color = "1a1b26";

      ring-color = "414868";
      ring-clear-color = "9ece6a";
      ring-ver-color = "7aa2f7";
      ring-wrong-color = "f7768e";

      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";

      text-color = "a9b1d6";
      text-clear-color = "a9b1d6";
      text-ver-color = "a9b1d6";
      text-wrong-color = "a9b1d6";

      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";

      grace = 2;
      grace-no-mouse = true;
      grace-no-touch = true;

      fade-in = 0.2;

      ignore-empty-password = true;
      show-failed-attempts = true;
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };

  systemd.user.services.swaybg = {
    package = pkgs.swaybg;
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
      Requisite = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ../../../wallpapers/elizabeth.jpg";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["niri.service"];
    };
  };

  home.file = {
    "Pictures/Screenshots/.keep".text = "";
    "Pictures/Wallpapers/.keep".text = "";
    "Videos/Recordings/.keep".text = "";
  };
}
