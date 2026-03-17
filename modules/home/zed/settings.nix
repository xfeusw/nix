{ ... }:
{
  use_system_prompts = false;
  use_system_path_prompts = false;
  disable_ai = true;
  vim_mode = true;
  base_keymap = "VSCode";
  buffer_font_family = "MonoLisa";
  buffer_font_size = 14;
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
  relative_line_numbers = "disabled";
  cursor_blink = true;
  cursor_shape = "bar";
  theme = {
    mode = "system";
    light = "Gruvbox Light";
    dark = "Tokyo Night Storm";
  };
  vim = {
    use_system_clipboard = "always";
  };
  scrollbar = {
    show = "always";
  };
  terminal = {
    dock = "left";
    font_size = 13;
    shell = "system";
    line_height = "comfortable";
    font_family = "JetbrainsMono Nerd Font";
    default_width = 800;
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
    enabled = false;
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
  languages = {
    TypeScript = {
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
    };
    TSX = {
      inlay_hints = {
        show_type_hints = false;
      };
      code_actions_on_format = {
        "source.organizeImports" = true;
      };
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
    };
    JSON = {
      formatter = "prettier";
    };
  };
  git = {
    git_gutter = "tracked_files";
    inline_blame = {
      delay_ms = 600;
      enabled = true;
    };
  };

  bottom_dock_layout = "contained";

  lsp = import ./lsp.nix { };
}
