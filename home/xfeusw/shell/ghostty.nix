# home/xfeusw/shell/ghostty.nix
{ unstable, ... }:
{
  # Ensure Ghostty is installed from unstable channel
  home.packages = with unstable; [
    ghostty
  ];

  # Ghostty configuration file
  home.file.".config/ghostty/config".text = ''
    # Theme and appearance
    font-family = JetBrains Mono
    font-size = 11
    background-opacity = 0.95
    background = 1e1e2e
    foreground = c0caf5

    # Window settings
    window-decoration = true
    window-padding-x = 10
    window-padding-y = 10

    # Shell integration with ZSH
    shell-integration = zsh
  '';
}
