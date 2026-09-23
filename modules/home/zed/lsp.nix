{ pkgs, ... }:
let
  ts-js = {
    inlayHints = {
      parameterNames = {
        enabled = "all";
        suppressWhenArgumentMatchesName = false;
      };
      parameterTypes = {
        enabled = true;
      };
      variableTypes = {
        enabled = true;
        suppressWhenTypeMatchesName = true;
      };
      propertyDeclarationTypes = {
        enabled = true;
      };
      functionLikeReturnTypes = {
        enabled = true;
      };
      enumMemberValues = {
        enabled = true;
      };
    };
    implementationsCodeLens = {
      enabled = true;
      showOnAllClassMethods = true;
      showOnInterfaceMethods = true;
    };
    referencesCodeLens = {
      enabled = true;
      showOnAllFunctions = true;
    };
  };
in
{
  rust-analyzer = {
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
    };
  };

  hls = {
    initialization_options = {
      haskell = {
        formattingProvider = "fourmolu";
        cabalFormattingProvider = "cabal-fmt";

        plugin = {
          class.globalOn = true;
          eval.globalOn = true;

          fourmolu = {
            config.external = pkgs.fourmolu;
          };

          ghcide-code-actions-bindings.globalOn = true;
          ghcide-code-actions-fill-holes.globalOn = true;
          ghcide-code-actions-imports-exports.globalOn = true;
          ghcide-code-actions-type-signatures.globalOn = true;
          ghcide-completions.globalOn = true;
          ghcide-hover-and-symbols.globalOn = true;
          ghcide-type-lenses.globalOn = true;
          hlint.globalOn = true;
          importLens.globalOn = true;
          moduleName.globalOn = true;
          pragmas.globalOn = true;
          rename.globalOn = true;
          retrie.globalOn = true;
          semanticTokens.globalOn = true;
          splice.globalOn = true;
          stan.globalOn = true;
          signatureHelp.globalOn = true;
        };
      };
    };
  };

  nixd = {
    formatting = {
      command = [
        "nixfmt"
      ];
    };
    options = {
      enable = true;
    };
  };

  jdtls = {
    settings = {
      java_home = pkgs.openjdk25;
      lombok_support = true;
    };
  };

  vtsls = {
    initialization_options = {
      settings = {
        javascript = ts-js;
        typescript = ts-js;
      };
    };
  };

  idris2 = {
    binary = {
      path = "idris2-lsp";
    };
  };
}
