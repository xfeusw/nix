# packages/dev/tooling.nix
{ unstablePkgs, ... }:
with unstablePkgs;
[
  gcc
  cmake
  gnumake
  pkg-config
  gdb
]
