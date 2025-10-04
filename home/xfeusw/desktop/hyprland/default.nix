{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = builtins.foldl' (acc: module: acc // module) {} [
      (import ./autostart.nix)
      (import ./input.nix)
      (import ./cursor-settings.nix)
      (import ./general.nix)
      (import ./decoration.nix)
      (import ./animations.nix)
      (import ./layout.nix)
      (import ./gestures.nix)
      (import ./misc.nix)
      (import ./bindings.nix)
      (import ./windowrules.nix)
    ];
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
  };

  home.packages = with pkgs; [ bibata-cursors ];
}
