{
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;

    settings = {
      global = {
        # Display
        monitor = 0;
        follow = "mouse";

        # Geometry
        width = 350;
        height = 120;
        origin = "top-right";
        offset = "20x20";

        # Progress bar
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 400;

        # Visual
        transparency = 10; # 10% transparent (90% opaque)
        separator_height = 2;
        padding = 15;
        horizontal_padding = 15;
        frame_width = 2;
        frame_color = "#7aa2f7";
        separator_color = "frame";

        # Sorting
        sort = true;

        # Text
        font = "Inter 11";
        line_height = 0;
        markup = "full";
        format = "<b>%a</b>\\n%s\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;

        # Icons
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 48;
        icon_path = "${pkgs.papirus-icon-theme}/share/icons/Papirus-Dark";

        # History
        sticky_history = true;
        history_length = 20;

        # Misc
        dmenu = "${pkgs.fuzzel}/bin/fuzzel -d";
        browser = "${pkgs.firefox}/bin/firefox";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        ignore_dbusclose = false;

        # Mouse actions
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };

      # Urgency levels - Tokyo Night theme
      urgency_low = {
        background = "#1a1b26E6";
        foreground = "#a9b1d6";
        frame_color = "#9ece6a";
        timeout = 3;
      };

      urgency_normal = {
        background = "#1a1b26E6";
        foreground = "#a9b1d6";
        frame_color = "#7aa2f7";
        timeout = 5;
      };

      urgency_critical = {
        background = "#1a1b26E6";
        foreground = "#a9b1d6";
        frame_color = "#f7768e";
        timeout = 0;
      };

      # App-specific rules
      spotify = {
        appname = "Spotify";
        timeout = 3;
        frame_color = "#1db954";
        format = "<b>%s</b>\\n%b";
      };

      volume = {
        appname = "volume";
        timeout = 2;
        frame_color = "#9ece6a";
      };

      brightness = {
        appname = "brightness";
        timeout = 2;
        frame_color = "#e0af68";
      };
    };
  };

  # Disable mako if it was enabled
  services.mako.enable = false;
}
