{ pkgs }:
with pkgs;
[
  typescript-language-server
  vscode-langservers-extracted
  pyright
  gopls
  marksman

  # Formatters
  nixpkgs-fmt
  black
  gofumpt

  # Additional tools
  fd
  tree-sitter
]
