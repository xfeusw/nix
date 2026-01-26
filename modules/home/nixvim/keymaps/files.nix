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

    # An alternative that DOES NOT respect ignore
    {
      mode = "n";
      key = "<leader>p";
      action = ":Telescope find_files hidden=true no_ignore=true follow=true<CR>";
      options.desc = "Find files (include ignored + dotfiles)";
    }

    # Source current file
    {
      mode = "n";
      key = "<leader><leader>";
      action = ":source %<CR>";
      options.desc = "Source current file";
    }

    # New file creation
    {
      mode = "n";
      key = "<leader>fn";
      action = ":ene | startinsert<CR>";
      options.desc = "New empty file";
    }

    {
      mode = "n";
      key = "<leader>fN";
      action.__raw = ''
        function()
        local dir = vim.fn.expand("%:p:h")
        if dir == "" then
        vim.cmd("ene")
        else
        vim.cmd("edit " .. dir .. "/")
        end
        vim.cmd("startinsert")
        end
      '';
      options.desc = "New file in current directory";
    }

    # .env and ignored files helpers
    {
      mode = "n";
      key = "<leader>fe";
      action = ":edit .env<CR>";
      options.desc = "Open .env (project root)";
    }

    {
      mode = "n";
      key = "<leader>fE";
      action = ":Telescope find_files hidden=true no_ignore=true search_file=.env<CR>";
      options.desc = "Find .env* files (including ignored)";
    }
  ];
}
