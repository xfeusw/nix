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

        disable_ai = true;

        telemetry = {
          metrics = false;
          diagnostics = false;
        };

        show_edit_predictions = false;

        inlay_hints = {
          enabled = true;
          show_type_hints = true;
          show_parameter_hints = true;
          show_other_hints = true;
          show_background = true;
        };

        node = {
          path = lib.getExe pkgs.nodejs;
          npm_path = lib.getExe' pkgs.nodejs "npm";
        };

        tab_size = 2;
        preferred_line_length = 75;

        autosave = "off";
        enable_language_server = true;

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

        session = {
          trust_all_worktrees = true;
        };
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
