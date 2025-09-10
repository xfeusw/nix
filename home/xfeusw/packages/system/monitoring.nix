# packages/system/monitoring.nix
{ unstablePkgs }:
with unstablePkgs;
[
  btop
  lsof
  strace
  sysstat
]
