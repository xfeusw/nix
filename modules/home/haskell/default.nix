{pkgs, ...}: let
  h = pkgs.haskell.packages.ghc912;
  hpkgs = pkgs.haskellPackages;
in {
  home.packages = [
    h.ghc
    h.cabal-install
    h.haskell-language-server
    hpkgs.cabal-fmt
    h.fourmolu
    h.hlint
  ];
}
