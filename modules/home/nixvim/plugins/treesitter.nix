{
  programs.nixvim = {
    treesitter = {
      enable = true;
      nixGrammars = true;

      ensureInstalled = [
        "haskell"
        "nix"
        "lua"
        "bash"
        "json"
        "yaml"
        "toml"
        "rust"
        "go"
        "markdown"
      ];

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-context = {
      enable = true;
      settings = {max_lines = 2;};
    };

    filetype = {
      extension = {
        hs = "haskell";
        lhs = "lhaskell";
      };
    };

    globals = {
      haskell_enable_quantification = 0;
      haskell_enable_recursivedo = 0;
      haskell_enable_arrows = 0;
      haskell_enable_pattern_synonyms = 0;
      haskell_enable_typeroles = 0;
      haskell_enable_static_pointers = 0;
    };
  };
}
