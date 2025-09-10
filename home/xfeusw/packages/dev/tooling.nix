# packages/dev/tooling.nix
{ unstablePkgs }:
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
