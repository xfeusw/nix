{ pkgs, ... }:
let
  h = pkgs.haskell.packages.ghc910;
  hpkgs = pkgs.haskellPackages;
in
{
  home.packages = [
    h.ghc
    h.cabal-install
    h.haskell-language-server
    hpkgs.cabal-fmt
    hpkgs.cabal-gild
    hpkgs.stack
    h.fourmolu
    h.hlint
  ];
}
