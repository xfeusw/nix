{
  programs.nixvim.keymaps = [
    # Copy entire file
    {
      mode = "n";
      key = "<leader>y";
      action = ":%y+<CR>";
      options.desc = "Copy entire file";
    }

    # Toggle file explorer
    {
      mode = "n";
      key = "<leader>e";
      action = ":NvimTreeToggle<CR>";
      options.desc = "Toggle file explorer";
    }
    {
      mode = "n";
      key = "<leader>E";
      action = ":NvimTreeFindFile<CR>";
      options.desc = "Find current file in explorer";
    }

    # Telescope file operations
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Telescope buffers<CR>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ":Telescope help_tags<CR>";
      options.desc = "Find help";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = ":Telescope oldfiles<CR>";
      options.desc = "Recent files";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = ":Telescope commands<CR>";
      options.desc = "Find commands";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = ":Telescope keymaps<CR>";
      options.desc = "Find keymaps";
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = ":Telescope diagnostics<CR>";
      options.desc = "Find diagnostics";
    }

    # Source current file
    {
      mode = "n";
      key = "<leader><leader>";
      action = ":source %<CR>";
      options.desc = "Source current file";
    }
  ];
}
