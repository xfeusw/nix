{ pkgs }: {
  language-server = {
    nil = {
      command = "${pkgs.nil}/bin/nil";
    };

    rust-analyzer = {
      command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      config = {
        check.command = "clippy";
        inlayHints.bindingModeHints.enable = false;
        inlayHints.closingBraceHints.minLines = 10;
        inlayHints.closureReturnTypeHints.enable = "with_block";
        inlayHints.discriminantHints.enable = "fieldless";
        inlayHints.lifetimeElisionHints.enable = "skip_trivial";
        inlayHints.typeHints.hideClosureInitialization = false;
      };
    };

    typescript-language-server = {
      command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
      args = [ "--stdio" ];
    };

    vscode-langservers-extracted = {
      command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
      args = [ "--stdio" ];
    };

    pyright = {
      command = "${pkgs.pyright}/bin/pyright-langserver";
      args = [ "--stdio" ];
    };

    gopls = {
      command = "${pkgs.gopls}/bin/gopls";
    };

    marksman = {
      command = "${pkgs.marksman}/bin/marksman";
      args = [ "server" ];
    };

    haskell-language-server = {
      command = "${pkgs.haskell-language-server}/bin/haskell-language-server-wrapper";
      args = [ "--lsp" ];
    };
  };

  language = [
    {
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.alejandra}/bin/alejandra";
      language-servers = [ "nil" ];
    }
    {
      name = "rust";
      auto-format = true;
      language-servers = [ "rust-analyzer" ];
    }
    {
      name = "typescript";
      auto-format = true;
      language-servers = [ "typescript-language-server" ];
    }
    {
      name = "javascript";
      auto-format = true;
      language-servers = [ "typescript-language-server" ];
    }
    {
      name = "json";
      auto-format = true;
      language-servers = [ "vscode-langservers-extracted" ];
    }
    {
      name = "python";
      auto-format = true;
      formatter.command = "${pkgs.black}/bin/black";
      formatter.args = [ "-" "--quiet" ];
      language-servers = [ "pyright" ];
    }
    {
      name = "go";
      auto-format = true;
      formatter.command = "${pkgs.gofumpt}/bin/gofumpt";
      language-servers = [ "gopls" ];
    }
    {
      name = "markdown";
      auto-format = true;
      language-servers = [ "marksman" ];
    }
    {
      name = "haskell";
      auto-format = true;
      formatter.command = "${pkgs.ormolu}/bin/ormolu";
      language-servers = [ "haskell-language-server" ];
    }
  ];
}
