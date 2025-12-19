{
  theme = "tokyonight";

  editor = {
    line-number = "absolute";
    mouse = true;
    cursorline = true;
    cursorcolumn = false;
    auto-completion = true;
    auto-format = false;
    auto-save = false;
    idle-timeout = 400;
    completion-trigger-len = 2;
    scrolloff = 8;
    color-modes = true;
    bufferline = "multiple";

    # Clipboard configuration
    clipboard-provider = "wayland";

    statusline = {
      left = ["mode" "spinner" "file-name" "file-modification-indicator"];
      center = ["diagnostics"];
      right = ["selections" "position" "file-encoding" "file-line-ending" "file-type"];
      separator = "│";
      mode = {
        normal = "NORMAL";
        insert = "INSERT";
        select = "SELECT";
      };
    };

    lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };

    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };

    file-picker = {
      hidden = false;
    };

    indent-guides = {
      render = true;
      character = "│";
      skip-levels = 1;
    };
  };
}
