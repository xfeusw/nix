# home/xfeusw/nixvim/default.nix
{ pkgs, unstable, ... }:
{
  programs.nixvim = {
    enable = true;

    extraConfigLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.cmd.colorscheme("tokyonight")
    '';
    plugins = {
      treesitter.enable = true;
      lsp.enable = true;
      telescope.enable = true;
    };
  };
}
