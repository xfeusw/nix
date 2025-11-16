{ pkgs }:
with pkgs.vscode-extensions; [
  # Nix support
  bbenoist.nix
  kamadorueda.alejandra

  # UI/Theme
  pkief.material-icon-theme
  enkia.tokyo-night

  # Language support
  rust-lang.rust-analyzer
  haskell.haskell
  tamasfe.even-better-toml

  # Essential tools
  vadimcn.vscode-lldb
] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-just-syntax";
    publisher = "nefrob";
    version = "0.8.0";
    sha256 = "sha256-zuDfIxhiUKRpVRxp9BceW6WPBq5NNCuS1Si0/6kfqF8=";
  }
  {
    name = "dotenv";
    publisher = "mikestead";
    version = "1.0.1";
    sha256 = "sha256-dieCzNOIcZiTGu4Mv5zYlG7jLhaEsJR05qbzzzQ7RWc=";
  }
]
