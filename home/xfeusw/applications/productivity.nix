# home/xfeusw/applications/productivity.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # PDF tools
    pdftk

    # Archive tools
    unrar
    p7zip

    # Clipboard manager
    copyq
  ];
}
