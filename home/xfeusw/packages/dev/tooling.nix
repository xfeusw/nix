# packages/dev/tooling.nix
{ pkgs, unstablePkgs }:
with unstablePkgs;
[
  pnpm
  nil
  nixd
  gcc
  cmake
  gnumake
  pkg-config
  gdb
  cabal-install
  stack
]
