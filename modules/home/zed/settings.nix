{ pkgs, ... }:
{
  use_system_prompts = false;
  use_system_path_prompts = false;
  disable_ai = true;
  vim_mode = false;
  base_keymap = "VSCode";
  buffer_font_family = "JetBrainsMono Nerd Font";
  buffer_font_size = 12;
  buffer_font_features = {
    calt = true;
    ss08 = true;
    ss07 = true;
    zero = true;
    ss04 = true;
    ss01 = true;
    ss05 = true;
    ss18 = true;
    ss10 = true;
    ss11 = true;
    ss12 = true;
    ss13 = true;
    ss16 = true;
    ss15 = true;
    ss17 = true;
  };
  tab_size = 2;
  relative_line_numbers = "disabled";
  cursor_blink = true;
  cursor_shape = "bar";
  theme = {
    mode = "system";
    light = "Ninja Cosmic";
    dark = "Ninja Cosmic";
  };
  vim = {
    use_system_clipboard = "always";
  };
  scrollbar = {
    show = "always";
  };
  terminal = {
    dock = "left";
    font_size = 12;
    cursor_shape = "bar";
    shell = "system";
    line_height = "comfortable";
    font_family = "JetBrainsMono Nerd Font";
    font_weight = 300;
    default_width = 450;
    font_features = {
      calt = true;
      ss08 = true;
      ss07 = true;
      zero = true;
      ss04 = true;
      ss01 = true;
      ss05 = true;
      ss18 = true;
      ss10 = true;
      ss11 = true;
      ss12 = true;
      ss13 = true;
      ss16 = true;
      ss15 = true;
      ss17 = true;
    };
  };
  inlay_hints = {
    enabled = true;
  };
  agent = {
    enabled = false;
  };
  diagnostics = {
    button = true;
    include_warnings = true;
    inline = {
      enabled = true;
      update_debounce_ms = 130;
      padding = 4;
      min_column = 0;
      max_severity = null;
    };
  };
  icon_theme = "Material Icon Theme";
  project_panel = {
    dock = "right";
  };
  use_autoclose = true;

  # Languages
  languages = {
    JavaScript = {
      inlay_hints = {
        show_type_hints = true;
      };
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
      language_servers = [
        "vtsls"
      ];
    };
    JSX = {
      inlay_hints = {
        show_type_hints = true;
      };
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
      language_servers = [
        "vtsls"
      ];
    };
    TypeScript = {
      inlay_hints = {
        show_type_hints = true;
      };
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
      language_servers = [
        "vtsls"
      ];
    };
    TSX = {
      inlay_hints = {
        show_type_hints = true;
      };
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
      language_servers = [
        "vtsls"
      ];
    };
    SCSS = {
      formatter = "prettier";
      language_servers = [
        "tailwindcss-language-server"
        "..."
      ];
    };
    CSS = {
      formatter = "prettier";
    };
    Rust = {
      inlay_hints = {
        enabled = true;
      };
      tab_size = 4;
    };
    JSON = {
      format_on_save = "on";
      formatter = "prettier";
    };
    Haskell = {
      format_on_save = "off";
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = true;
      };
      tab_size = 2;
      enable_language_server = true;
      show_completions_on_input = true;
      show_completion_documentation = true;
      colorize_brackets = true;
    };
    Nix = {
      format_on_save = "on";
      formatter = "language_server";
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = true;
      };
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
      language_servers = [
        "nixd"
      ];
      enable_language_server = true;
      show_completions_on_input = true;
      show_completion_documentation = true;
      colorize_brackets = true;
      tab_size = 2;
    };
  };
  git = {
    git_gutter = "tracked_files";

    inline_blame = {
      enabled = true;
      delay_ms = 300;
    };

    hunk_summary = "tracked_files";
  };

  bottom_dock_layout = "contained";

  lsp = import ./lsp.nix { inherit pkgs; };
}
