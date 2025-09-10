# packages/system/core-tools.nix
{ unstablePkgs }:
with unstablePkgs;
[
  tree
  wget
  curl
  coreutils
  gnupg
]
