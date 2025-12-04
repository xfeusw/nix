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
    "go"
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
      gopls = {
        binary = {
          ignore_system_version = false;
        };
        initialization_options = {
          hints = {
            assignVariableTypes = true;
            compositeLiteralFields = true;
            compositeLiteralTypes = true;
            constantValues = true;
            functionTypeParameters = true;
            parameterNames = true;
            rangeVariableTypes = true;
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
      Rust = {
        language_servers = ["rust-analyzer"];
        tab_size = 4;
      };
      Nix = {
        language_servers = [
          "nixd"
          "!nil"
        ];
      };
      Go = {
        language_servers = ["gopls"];
        tab_size = 4;
        hard_tabs = true;
      };
      Haskell = {
        language_servers = [
          "hls"
        ];
      };
      TypeScript = {
        language_servers = ["typescript-language-server"];
      };
      TSX = {
        language_servers = ["typescript-language-server"];
      };
      JavaScript = {
        language_servers = ["typescript-language-server"];
      };
      JSX = {
        language_servers = ["typescript-language-server"];
      };
      GitIgnore = {
        language_servers = [];
      };
    };
    format_on_save = "off";
    soft_wrap = "editor_width";
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
    load_direnv = "shell_hook";
    confirm_quit = false;
    use_autoclose = false;
    inlay_hints = {
      enabled = true;
    };
    collaboration_panel = {
      button = false;
    };
    chat_panel = {
      button = false;
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
