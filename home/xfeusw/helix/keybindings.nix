{
  normal = {
    # File explorer (using file picker)
    e = "file_picker";
    E = "file_picker_in_current_directory";

    # Space as leader key
    space = {
      f = {
        f = "file_picker";
        g = "file_picker_in_current_directory";
        r = "file_picker_in_current_buffer_directory";
      };
      b = {
        b = "buffer_picker";
        n = ":buffer-next";
        p = ":buffer-previous";
        d = ":buffer-close";
      };
      w = {
        w = ":write";
        q = ":quit";
        a = ":write-all";
      };
      "/" = "global_search";
      "?" = "command_palette";
    };

    # Quick save
    C-s = ":write";

    # Better window navigation
    C-h = "jump_view_left";
    C-j = "jump_view_down";
    C-k = "jump_view_up";
    C-l = "jump_view_right";

    # LSP shortcuts
    g = {
      d = "goto_definition";
      r = "goto_reference";
      i = "goto_implementation";
      t = "goto_type_definition";
    };
  };

  insert = {
    # Exit insert mode
    j.k = "normal_mode";
  };

  select = {
    # Exit select mode
    esc = "normal_mode";
  };
}
