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
    # Using manual color configuration since themeFile requires a file path
    extraConfig = ''
      # Tokyo Night theme colors
      foreground #c0caf5
      background #1a1b26
      selection_foreground #c0caf5
      selection_background #33467c

      # Black
      color0 #15161e
      color8 #414868

      # Red
      color1 #f7768e
      color9 #f7768e

      # Green
      color2  #9ece6a
      color10 #9ece6a

      # Yellow
      color3  #e0af68
      color11 #e0af68

      # Blue
      color4  #7aa2f7
      color12 #7aa2f7

      # Magenta
      color5  #bb9af7
      color13 #bb9af7

      # Cyan
      color6  #7dcfff
      color14 #7dcfff

      # White
      color7  #a9b1d6
      color15 #c0caf5

      # Tab colors
      active_tab_foreground   #1a1b26
      active_tab_background   #7aa2f7
      inactive_tab_foreground #c0caf5
      inactive_tab_background #414868
    '';

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
