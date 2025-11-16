{pkgs}:
with pkgs; [
  # Language servers
  nil
  rust-analyzer
  nodePackages.typescript-language-server
  vscode-langservers-extracted
  pyright
  gopls
  marksman

  # Formatters
  nixpkgs-fmt
  black
  gofumpt

  # Additional tools
  ripgrep
  fd
  tree-sitter
]
