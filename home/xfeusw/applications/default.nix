# home/xfeusw/applications/default.nix
{ pkgs, unstable, ... }:
{
  imports = [
    ./browsers.nix
    ./media.nix
    ./productivity.nix
    ./communication.nix
  ];

  # Allow both stable and unstable packages
  home.packages = with pkgs; [
    # Text editors
    vscode
    unstable.zed-editor
  ];
}
