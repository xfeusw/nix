# packages/system/cli-utils.nix
{ unstablePkgs }:
with unstablePkgs;
[
  gnupg
  coreutils
  util-linux
  findutils
]
