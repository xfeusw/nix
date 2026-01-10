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

      extensions = [
        "assembly"
        "catppuccin"
        "deno"
        "dracula"
        "elm"
        "env"
        "git-firefly"
        "github-theme"
        "haskell"
        "html"
        "just"
        "lua"
        "make"
        "material-icon-theme"
        "nginx"
        "nix"
        "one-dark-pro"
        "tokyo-night"
        "sql"
        "toml"
        "typst"
        "xml"
        "yaml"
      ];

      userSettings = {
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

        languages = {
          Markdown = {
            format_on_save = "on";
            use_on_type_format = true;
            remove_trailing_whitespace_on_save = true;
          };

          Nix = {
            formatter = "language_server";
            language_servers = [
              "nixd"
              "!nil"
            ];
          };

          TypeScript = {
            language_servers = [
              "typescript-language-server"
              "deno"
              "!vtsls"
              "!eslint"
            ];
            formatter = "language_server";
          };

          TSX = {
            language_servers = [
              "typescript-language-server"
              "deno"
              "!eslint"
              "!vtsls"
            ];
            formatter = "language_server";
          };

          Haskell = {
            format_on_save = "off";
          };

          Rust = {
            language_servers = [
              "rust_analyzer"
            ];
            # formatter = "language_server";
            # format_on_save = "on";
            tab_size = 2;
          };

          Elm = {
            language_serverss = [
              "elm-language-server"
            ];
            formatter = "language_server";
            format_on_save = "on";
            tab_size = 2;
          };
        };

        lsp = {
          nixd = {
            binary = {
              ignore_system_version = false;
            };
            settings = {
              formatting = {
                command = [
                  "alejandra"
                ];
              };
              diagnostic = {
                suppress = [
                  "sema-extra-with"
                  "sema-extra-rec"
                ];
              };
            };
          };

          rust-analyzer = {
            binary = {
              ignore_system_version = false;
            };
            initialization_options = {
              check = {
                command = "clippy";
              };
            };
          };

          deno = {
            binary = {
              ignore_system_version = false;
            };
          };

          typescript-language-server = {
            binary = {
              ignore_system_version = false;
            };
            initialization_options = {
              preferences = {
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayVariableTypeHints = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayEnumMemberValueHints = true;
              };
            };
          };

          haskell = {
            initialization_options = {
              haskell = {
                formattingProvider = "fourmolu";
              };
            };
          };

          elm-language-server = {
            binary = {
              ignore_system_version = false;
            };
          };
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
