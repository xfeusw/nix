{...}: {
  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
        editor = "nvim";
      };

      preview = {
        enable = true;
        max_width = 120;
        max_height = 80;
      };
    };

    keymap = {
      normal = {
        "e" = "open";
        "ctrl-y" = "cd ..";
      };
    };

    theme = {
      mgr = {
        border = "blue";
        selection = "bold yellow";
      };
    };
  };
}
