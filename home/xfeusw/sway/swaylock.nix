{
  config,
  lib,
  pkgs,
  ...
}: {
  programs = {
    swaylock = {
      package = pkgs.swaylock;

      enable = true;
      settings = {
        indicator-caps-lock = true;
        show-keyboard-layout = true;

        ignore-empty-password = true;

        indicator-radius = 80;
        indicator-thickness = 10;
      };
    };
  };
}
