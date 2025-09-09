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
          rust_analyzer = {
            enable = true; # Fixed: Changed from rust-analyzer
            installCargo = false; # Provided by rustup
            installRustc = false; # Provided by rustup
          };
          hls = {
            enable = true;
            installGhc = false; # Provided by haskell.compiler.ghc96
          };
          metals.enable = true; # Scala LSP
          nil_ls = {
            enable = true; # Fixed: Changed from nil-ls
          };
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
      cmp.enable = true; # Fixed: Changed from nvim-cmp
      web-devicons.enable = true; # Explicitly enable to avoid deprecation warning
    };
  };
}
