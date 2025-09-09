# home/xfeusw/kitty.nix
{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;

    # Font configuration
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 12;
    };

    # Theme and colors (Tokyo Night theme to match your nixvim)
    theme = "Tokyo Night";

    settings = {
      # Performance
      sync_to_monitor = "yes";

      # Appearance
      window_padding_width = 8;
      background_opacity = "0.95";
      dynamic_background_opacity = "yes";

      # Cursor
      cursor_shape = "beam";
      cursor_blink_interval = 0;

      # Scrollback
      scrollback_lines = 10000;

      # Tab bar
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      # Window layout
      remember_window_size = "yes";
      initial_window_width = 1200;
      initial_window_height = 800;

      # Miscellaneous
      enable_audio_bell = "no";
      confirm_os_window_close = 0;

      # Shell integration
      shell_integration = "enabled";

      # URL handling
      detect_urls = "yes";

      # Copy/paste
      copy_on_select = "clipboard";
    };

    # Key bindings
    keybindings = {
      # Tab management
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";

      # Window management
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+n" = "new_os_window";

      # Font size
      "ctrl+shift+equal" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";

      # Scrolling
      "ctrl+shift+up" = "scroll_line_up";
      "ctrl+shift+down" = "scroll_line_down";
      "ctrl+shift+page_up" = "scroll_page_up";
      "ctrl+shift+page_down" = "scroll_page_down";
      "ctrl+shift+home" = "scroll_home";
      "ctrl+shift+end" = "scroll_end";
    };
  };
}
