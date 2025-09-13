# modules/packages/development-cli.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Development essentials
    gh # GitHub CLI
    lazygit # Git TUI
    docker-compose
  ];
}
