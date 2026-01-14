{
  lib,
  pkgs,
  config,
  ...
}: {
  config = {
    programs.zed-editor = {
      enable = true;

      package = pkgs.stable.zed-editor;

      extensions = import ./extensions.nix;

      userSettings = {
        languages = import ./languages.nix;
        lsp = import ./lsp.nix;

        assistant = {
          enabled = false;
        };

        disable_ai = true;

        telemetry = {
          metrics = false;
          diagnostics = false;
        };

        show_edit_predictions = false;

        node = {
          path = lib.getExe pkgs.nodejs;
          npm_path = lib.getExe pkgs.pnpm;
        };

        tab_size = 2;
        preferred_line_length = 75;

        autosave = "off";
        enable_language_server = true;

        hour_format = "hour12";
        auto_update = false;

        theme = {
          dark = "Tokyo Night";
          light = "Tokyo Night Light";
          mode = "dark";
        };

        icon_theme = {
          "dark" = "Material Icon Theme";
          "light" = "Material Icon Theme";
          "mode" = "dark";
        };

        show_whitespaces = "all";
        ui_font_size = 13;
        buffer_font_size = 13;
        buffer_font_family = "FiraCode Nerd Font";

        active_pane_modifiers = {
          inactive_opacity = 0.8;
        };

        project_panel = {
          button = true;
          dock = "right";
        };

        agent = {
          enabled = false;
        };

        load_direnv = "shell_hook";
        base_keymap = "VSCode";
      };

      # userKeymaps = [
      # {
      #   context = "Workspace";
      #   bindings = {
      #     "ctrl-'" = "terminal_panel::toggle";
      #   };
      # }
      # ];
    };
  };
}
