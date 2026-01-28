{
  programs.nixvim.keymaps = [
    # Toggle undo tree
    {
      mode = "n";
      key = "<leader>u";
      action = ":UndotreeToggle<CR>";
      options.desc = "Toggle undo tree";
    }

    # Theme switching - Tokyo Night variants
    {
      mode = "n";
      key = "<leader>tn";
      action = ":lua vim.cmd('colorscheme tokyonight-night')<CR>";
      options.desc = "Tokyo Night (night)";
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = ":lua vim.cmd('colorscheme tokyonight-storm')<CR>";
      options.desc = "Tokyo Night (storm)";
    }
    {
      mode = "n";
      key = "<leader>td";
      action = ":lua vim.cmd('colorscheme tokyonight-day')<CR>";
      options.desc = "Tokyo Night (day)";
    }
    {
      mode = "n";
      key = "<leader>tm";
      action = ":lua vim.cmd('colorscheme tokyonight-moon')<CR>";
      options.desc = "Tokyo Night (moon)";
    }

    # Theme switching - Other colorschemes
    {
      mode = "n";
      key = "<leader>tg";
      action = ":colorscheme gruvbox<CR>";
      options.desc = "Gruvbox";
    }
    {
      mode = "n";
      key = "<leader>tc";
      action = ":colorscheme catppuccin<CR>";
      options.desc = "Catppuccin";
    }
    {
      mode = "n";
      key = "<leader>to";
      action = ":colorscheme onedark<CR>";
      options.desc = "OneDark";
    }
    {
      mode = "n";
      key = "<leader>tk";
      action = ":colorscheme kanagawa<CR>";
      options.desc = "Kanagawa";
    }

    # Toggle line numbers
    {
      mode = "n";
      key = "<leader>ln";
      action = ":set number!<CR>";
      options.desc = "Toggle line numbers";
    }
    {
      mode = "n";
      key = "<leader>lr";
      action = ":set relativenumber!<CR>";
      options.desc = "Toggle relative numbers";
    }

    # Toggle wrap
    {
      mode = "n";
      key = "<leader>lw";
      action = ":set wrap!<CR>";
      options.desc = "Toggle line wrap";
    }
  ];
}
