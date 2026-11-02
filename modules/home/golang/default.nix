{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    go
    gopls
    gotools
    golangci-lint
    delve
  ];
}
