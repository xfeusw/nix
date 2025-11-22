{
  lib,
  pkgs,
  config,
  ...
}: let
  extensions = [
    "assembly"
    "deno"
    "env"
    "gitignore"
    "glsl"
    "haskell"
    "html"
    "ini"
    "just"
    "latex"
    "lua"
    "make"
    "material-icon-theme"
    "neocmake"
    "nginx"
    "nix"
    "nu"
    "pkl"
    "ruby"
    "slint"
    "sql"
    "swift"
    "toml"
    "typst"
    "tokyo-night"
    "vercel-theme"
    "wgsl"
    "xml"
    "zig"
  ];
  settings = {
    project_panel = {
      dock = "right";
    };
    icon_theme = "Material Icon Theme";
    tab_size = 2;
    theme = {
      mode = "system";
      light = "Tokyo Night";
      dark = "Tokyo Night";
    };
    lsp = {
      rust-analyzer = {
        binary = {
          ignore_system_version = false;
        };
        initialization_options = {
          inlayHints = {
            maxLength = null;
            lifetimeElisionHints = {
              enable = "skip_trivial";
              useParameterNames = true;
            };
            closureReturnTypeHints = {
              enable = "always";
            };
          };
          rust = {
            analyzerTargetDir = true;
          };
        };
      };
      nixd = {
        binary = {
          ignore_system_version = false;
        };
      };
      hls = {
        binary = {
          ignore_system_version = false;
        };
        initialization_options = {
          haskell = {
            formattingProvider = "fourmolu";
          };
        };
      };
      prettier = {
        binary = {
          ignore_system_version = false;
        };
      };
      typescript-language-server = {
        binary = {
          ignore_system_version = false;
        };
      };
    };
    languages = {
      Nix = {
        formatter = "alejandra";
        language_servers = [
          "nixd"
          "!nil"
        ];
      };

      Haskell = {
        formatter = "language_server";
        language_servers = [
          "hls"
        ];
      };

      TypeScript = {
        formatter = "prettier";
        language_servers = ["typescript-language-server"];
      };
      TSX = {
        formatter = "prettier";
        language_servers = ["typescript-language-server"];
      };
      JavaScript = {
        formatter = "prettier";
        language_servers = ["typescript-language-server"];
      };
      JSX = {
        formatter = "prettier";
        language_servers = ["typescript-language-server"];
      };

      GitIgnore = {
        formatter = "none";
        language_servers = [];
      };
    };

    format_on_save = "off";

    disable_ai = true;
    soft_wrap = "editor_width";
    active_pane_modifiers = {
      border_size = 0.0;
      inactive_opacity = 1.0;
    };
    bottom_dock_layout = "contained";
    buffer_font_family = "FiraCode Nerd Font Mono";
    buffer_font_size = 13;
    ui_font_size = 14;
    ui_font_family = "FreeSans";
    auto_update = false;
    telemetry = {
      metrics = false;
      diagnostics = false;
    };
    show_edit_predictions = false;
    load_direnv = "shell_hook";
    confirm_quit = false;
    use_autoclose = false;
    inlay_hints = {
      enabled = true;
    };
    title_bar = {
      show_branch_icon = true;
    };
    collaboration_panel = {
      button = false;
    };
    chat_panel = {
      button = "never";
    };
    agent = {
      enabled = false;
    };
  };
in {
  config = {
    programs.zed-editor = {
      enable = true;
      inherit extensions;
      userSettings = settings;
      installRemoteServer = true;
      package = pkgs.zed-editor;
    };
  };
}
