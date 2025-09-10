# packages/dev/haskell.nix
{ unstablePkgs, ... }:
with unstablePkgs;
[
  haskell.compiler.ghc96
  cabal-install
  stack
]
