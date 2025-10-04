{
  env = {
    # Cursor theme and size — globally for Wayland and Xwayland
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
  };

  cursor = {
    # Hyprland-specific cursor handling
    no_hardware_cursors = false;   # leave hardware cursors enabled unless buggy GPU
    hide_on_key_press = false;     # don’t hide cursor when typing
  };

  # Optional: adjust pointer speed and acceleration
  input = {
    accel_profile = "flat";  # ‘flat’ for raw, no acceleration
    sensitivity = 0.3;       # positive = faster, negative = slower
  };

  home.packages = with pkgs; [
    bibata-cursors
  ];
}
