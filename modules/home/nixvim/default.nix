{
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    colorscheme = lib.mkForce "tokyonight";

    colorschemes = {
      tokyonight = {
        enable = true;
        settings.style = "night"; # Options: "storm", "night", "day", "moon"
      };
      gruvbox.enable = true;
      catppuccin.enable = true;
      onedark.enable = true;
      kanagawa.enable = true;
    };
  };
}
