{ pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
        vimcmd_symbol = "[λ](bold blue)";
        vimcmd_replace_one_symbol = "[λ](bold purple)";
        vimcmd_replace_symbol = "[λ](bold purple)";
        vimcmd_visual_symbol = "[λ](bold yellow)";
      };
    };
  };
}
