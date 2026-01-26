{
  programs.nixvim.keymaps = [
    # Window navigation - Move between splits
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Move to left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Move to bottom window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Move to top window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Move to right window";
    }

    # Window splits - Create new splits
    {
      mode = "n";
      key = "<leader>sv";
      action = ":vsplit<CR>";
      options.desc = "Split window right";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = ":split<CR>";
      options.desc = "Split window below";
    }
    {
      mode = "n";
      key = "<leader>sx";
      action = ":close<CR>";
      options.desc = "Close current split";
    }
    {
      mode = "n";
      key = "<leader>se";
      action = "<C-w>=";
      options.desc = "Make splits equal size";
    }
    {
      mode = "n";
      key = "<leader>so";
      action = ":only<CR>";
      options.desc = "Close all other splits";
    }

    # Resize windows
    {
      mode = "n";
      key = "<C-Up>";
      action = ":resize +2<CR>";
      options.desc = "Increase window height";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = ":resize -2<CR>";
      options.desc = "Decrease window height";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      options.desc = "Decrease window width";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = ":vertical resize +2<CR>";
      options.desc = "Increase window width";
    }

    # Buffer navigation
    {
      mode = "n";
      key = "<S-h>";
      action = ":bprevious<CR>";
      options.desc = "Previous buffer";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = ":bnext<CR>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = ":bdelete<CR>";
      options.desc = "Delete buffer";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = ":%bd|e#|bd#<CR>";
      options.desc = "Close all buffers except current";
    }

    # Quick movements
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options.desc = "Scroll down and center";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options.desc = "Scroll up and center";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "Next search result (centered)";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options.desc = "Previous search result (centered)";
    }
  ];
}
