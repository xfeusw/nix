# packages/dev/languages.nix
{ unstablePkgs }:
with unstablePkgs;
[
  nodejs_22
  ruby
  haskell.compiler.ghc96
  jdk
  sbt
  scala
  cargo
  rustc
  rust-analyzer
  rustfmt
]
