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
      font = lib.generators.mkLuaInline ''wezterm.font("JetBrainsMono Nerd Font")'';
      font_size = 10.0;

      color_scheme = "Tinacious Design (Dark)";

      enable_wayland = true;
      window_decorations = "NONE";
      window_close_confirmation = "NeverPrompt";

      cursor_blink_rate = 800;
      cursor_thickness = 1;
      default_cursor_style = "BlinkingBar";

      show_tabs_in_tab_bar = true;
      use_fancy_tab_bar = false;
      hide_tab_bar_if_only_one_tab = true;

      scrollback_lines = 10000;
      audible_bell = "Disabled";
      hide_mouse_cursor_when_typing = true;
    };
  };
}
