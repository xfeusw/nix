# packages/dev/rust.nix
{ unstablePkgs, ... }:
with unstablePkgs;
[
  cargo
  rustc
  rust-analyzer
  rustfmt
]
