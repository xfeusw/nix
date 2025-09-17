{ ... }:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
      icon-theme = "Adwaita";
      cursor-theme = "Adwaita";
      text-scaling-factor = 0.9;

      gtk-application-prefer-dark-theme = true;
    };
    "org/gnome/desktop/input-sources" = {
      sources = [
        [ "xkb" "us" ]  # English (US) layout
        [ "xkb" "ru" ]  # Russian layout
      ];
      xkb-options = [
        "grp:alt_shift_toggle"  # Switch layouts with Alt+Shift
        "grp:win_space_toggle"  # Switch layouts with Win+Space
        "caps:escape"           # Caps Lock as Escape
        "eurosign:e"            # Euro sign on E key
      ];
    };
  };
}
