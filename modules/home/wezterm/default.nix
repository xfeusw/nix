{ pkgs, lib, ... }:
{
  # programs.kitty = lib.mkForce {
  #   enable = true;
  #   package = pkgs.kitty;
  #   settings = {
  #     confirm_os_window_close = 0;
  #     mouse_hide_wait = "-1.0";
  #     window_padding_width = 5;
  #     background_opacity = "0.5";
  #   };
  # };

  programs.wezterm = {
    enable = true;
    settings = {
      color_scheme = "Tinacious Design (Dark)";
      # window_background_opacity = 0.83;
      # font = "JetBrainsMono Nerd Font";
      font_size = 9.0;
      window_decorations = "NONE";
      window_close_confirmation = "NeverPrompt";
      cursor_blink_rate = 800;
      cursor_thickness = 1;
      show_tabs_in_tab_bar = true;
    };
  };
}
