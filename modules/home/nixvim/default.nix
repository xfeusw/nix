{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    enable = true;

    colorschemes.tokyonight.enable = true;
    plugins.lualine.enable = true;
  };
}
