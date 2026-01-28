{
  programs.nixvim.keymaps = [
    # Toggle floating terminal
    {
      mode = "n";
      key = "<C-t>";
      action = "<cmd>ToggleTerm<CR>";
      options.desc = "Terminal: Toggle (float)";
    }

    # Terminal in a horizontal split
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<CR>";
      options.desc = "Terminal: Horizontal";
    }

    # Terminal in a vertical split
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<CR>";
      options.desc = "Terminal: Vertical";
    }

    # Quick escape from terminal mode
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Terminal: Normal mode";
    }

    # Terminal-mode window navigation (same as your normal mode)
    {
      mode = "t";
      key = "<C-h>";
      action = "<C-\\><C-n><C-w>h";
      options.desc = "Terminal: Go left window";
    }
    {
      mode = "t";
      key = "<C-j>";
      action = "<C-\\><C-n><C-w>j";
      options.desc = "Terminal: Go down window";
    }
    {
      mode = "t";
      key = "<C-k>";
      action = "<C-\\><C-n><C-w>k";
      options.desc = "Terminal: Go up window";
    }
    {
      mode = "t";
      key = "<C-l>";
      action = "<C-\\><C-n><C-w>l";
      options.desc = "Terminal: Go right window";
    }
  ];
}
