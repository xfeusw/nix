# home/xfeusw/nixvim/default.nix
{ pkgs, unstable, ... }:
{
  programs.nixvim = {
    enable = true;

    extraConfigLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.cmd.colorscheme("tokyonight")
    '';

    plugins = {
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust-analyzer.enable = true; # Rust LSP
          hls.enable = true; # Haskell LSP
          metals.enable = true; # Scala LSP
          nil-ls.enable = true; # Nix LSP
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
      lualine.enable = true; # Status line
      nvim-cmp.enable = true; # Autocompletion
    };
  };
}
