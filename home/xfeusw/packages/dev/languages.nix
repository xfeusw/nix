# packages/dev/languages.nix
{ unstablePkgs }:
let
  rust = import ./rust.nix { inherit unstablePkgs; };
  nodejs = import ./nodejs.nix { inherit unstablePkgs; };
  nix = import ./nix.nix { inherit unstablePkgs; };
  haskell = import ./haskell.nix { inherit unstablePkgs; };
  javaScala = import ./java-scala.nix { inherit unstablePkgs; };
in
rust ++ nodejs ++ nix ++ haskell ++ javaScala
