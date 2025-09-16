# home/xfeusw/shell/ghostty.nix
{ pkgs, ... }:
{
  # Ensure Ghostty is installed
  home.packages = with pkgs; [
    unstable.ghostty
  ];

  # Ghostty configuration file
  home.file.".config/ghostty/config".text = ''
    # Theme and appearance
    theme = tokyonight
    background = 1e1e2e
    foreground = c0caf5
    font-family = JetBrains Mono
    font-size = 14
    font-style = Regular
    opacity = 0.9
    cursor-style = block
    cursor-color = f5c2e7

    # Palette for tokyonight theme (based on tokyonight.nvim from your nixvim setup)
    palette = 0=1e1e2e,1=f38ba8,2=a6e3a1,3=f9e2af,4=89b4fa,5=cba6f7,6=94e2d5,7=c0caf5,8=585b70,9=f38ba8,10=a6e3a1,11=f9e2af,12=89b4fa,13=cba6f7,14=94e2d5,15=c0caf5

    # Window settings
    window-decoration = false
    window-padding-x = 10
    window-padding-y = 10
    adjust-cell-width = -5%
    adjust-cell-height = -5%

    # Shell integration with ZSH
    shell = ${pkgs.zsh}/bin/zsh
    shell-integration = true

    # Keybindings
    keybind = ctrl+shift+c=copy
    keybind = ctrl+shift+v=paste
    keybind = ctrl+t=new_tab
    keybind = ctrl+w=close_tab
    keybind = ctrl+shift+t=increase_font_size
    keybind = ctrl+shift+r=decrease_font_size
    keybind = ctrl+shift+n=new_window
    keybind = ctrl+shift+left=previous_tab
    keybind = ctrl+shift+right=next_tab
    keybind = ctrl+shift+q=quit

    # Scrollback
    scrollback-size = 10000

    # Mouse behavior
    mouse-alternate-scroll = true
    mouse-select-autocopy = true
  '';
}
