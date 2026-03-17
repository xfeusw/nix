{
  pkgs,
  lib,
  ...
}:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        ruff.enable = true;
        dockerls.enable = true;
        docker_compose_language_service.enable = true;

        gopls = {
          enable = true;
          package = null;
        };

        hls = {
          enable = true;
          package = null;
          installGhc = false;
          ghcPackage = pkgs.haskell.packages.ghc910.ghc;
        };

        # rust-analyzer = {
        #   enable = true;
        #   package = null;
        #   autostart = true;
        # };
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };

    fidget = {
      enable = true;
      settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
        poll_rate = 1;
      };
    };

    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          credo.enable = true;
          golangci_lint.enable = true;
          statix.enable = true;
        };
        formatting = {
          gofmt.enable = true;
          goimports.enable = true;
          nixfmt.enable = true;
          markdownlint.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;

          rustfmt = {
            enable = true;
            package = null;
          };

          fourmolu = {
            enable = true;
            package = null;
          };
        };
      };
    };

    # mini-cmdline = {
    #   enable = true;
    #   autoLoad = false;
    #   settings = {
    #     autocomplete = true;
    #     autocorrect = true;
    #     autopeek = true;
    #   };
    # };

    # mini-completion = {
    #   enable = true;
    #   settings = {
    #     delay = {
    #       completion = 100;
    #       info = 100;
    #       signature = 50;
    #     };
    #     lsp_completion = {
    #       source_func = "completefunc";
    #       auto_setup = true;
    #     };
    #   };
    # };

    rustaceanvim = {
      enable = true;
      autoLoad = true;
      server = {
        cmd = [
          "rustup"
          "run"
          "nightly"
          "rust-analyzer"
        ];
        default_settings = {
          rust-analyzer = {
            check = {
              command = "clippy";
            };
            inlayHints = {
              lifetimeElisionHints = {
                enable = "always";
              };
            };
          };
        };
        standalone = false;
      };
    };
    trouble.enable = true;
    sqls.enable = true;
    yamlls.enable = true;
    jsonls.enable = true;
    taplo.enable = true;
  };
}
