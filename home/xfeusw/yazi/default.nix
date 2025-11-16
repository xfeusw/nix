{ ... }: {
  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
        editor = "hx";
      };

      preview = {
        enable = true;
        max_width = 120;
        max_height = 80;
      };
    };

    # Optional: custom keybindings
    keymap = {
      normal = {
        "e" = "open"; # press e to edit in Helix
        "ctrl-y" = "cd .."; # example remap
      };
    };

    # Optional theme override (if you want to customize colors)
    theme = {
      mgr = {
        border = "blue";
        selection = "bold yellow";
      };
    };
  };
}
