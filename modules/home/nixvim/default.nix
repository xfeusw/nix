{inputs, ...}: {
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;

    colorschemes.tokyonight.enable = true;
    plugins.lualine.enable = true;
  };
}
