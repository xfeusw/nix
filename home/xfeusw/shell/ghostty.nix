{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unstable.ghostty
  ];

  home.file.".config/ghostty/config".text = ''
    font-family = JetBrains Mono
    font-size = 11
    background-opacity = 0.95
    background = 1e1e2e
    foreground = c0caf5

    window-decoration = true
    window-padding-x = 10
    window-padding-y = 10

    shell-integration = zsh
  '';
}
