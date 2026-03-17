{ ... }:
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
      };
    };
  };

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
}
