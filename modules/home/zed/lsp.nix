{
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

  # rust-analyzer = {
  #   initialization_options = {
  #     check = {
  #       command = "clippy";
  #     };
  #     checkOnSave = true;
  #     inlayHints = {
  #       maxLength = null;
  #       lifetimeElisionHints = {
  #         enable = "skip_trivial";
  #         useParameterNames = true;
  #       };
  #       closureReturnTypeHints = {
  #         enable = "always";
  #       };
  #     };
  #   };
  #   enable_lsp_tasks = true;
  # };

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
        importModuleSpecifierPreference = "relative";
        jsxAttributeCompletionStyle = "auto";
      };
    };
  };

  tailwindcss-language-server = {
    binary = {
      ignore_system_version = false;
    };
    settings = {
      experimental = {
        classRegex = [
          ["class(Name)?\\s*[:=]\\s*['\"`]([^'\"`]*)['\"`]"]
          ["class(Name)?\\s*[:=]\\s*['\"`]([^'\"`]*)['\"`]"]
        ];
      };
    };
  };

  hls = {
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
}
