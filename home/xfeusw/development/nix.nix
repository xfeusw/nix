{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixd
    alejandra
  ];
}
