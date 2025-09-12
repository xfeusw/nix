# home/xfeusw/development/languages/nix.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix language servers
    nil
    nixd

    # Nix formatters
    nixpkgs-fmt
    alejandra

    # Nix tools
    nix-tree
    nix-du
    nix-index
    nix-output-monitor
    nixfmt-rfc-style
  ];
}
