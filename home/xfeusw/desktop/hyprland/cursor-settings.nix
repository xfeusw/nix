{
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
}
