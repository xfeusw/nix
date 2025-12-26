{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
  ];

  home.file.".config/ghostty/config".text = ''
    font-family = "FiraCode Nerd Font Mono"
    font-size = 11
    background-opacity = 1
    theme = TokyoNight Night

    window-decoration = true
    window-padding-x = 10
    window-padding-y = 10

    shell-integration = zsh
  '';
}
