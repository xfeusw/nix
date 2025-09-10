# packages/system/core-tools.nix
{ unstablePkgs }:
with unstablePkgs;
[
  tree
  wget
  curl
  git
  unzip
  htop
  fd
  ripgrep
  bat
  jq
  which
]
