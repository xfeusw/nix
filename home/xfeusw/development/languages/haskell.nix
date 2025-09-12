# home/xfeusw/development/languages/haskell.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Haskell compiler and tools
    haskell.compiler.ghc96
    cabal-install
    stack

    # Haskell language server
    haskell-language-server

    # Additional tools
    haskellPackages.fourmolu # Formatter
    haskellPackages.hlint # Linter
  ];
}
