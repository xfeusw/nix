{
  programs.nixvim.keymaps = [
    # -------------------------
    # Git UI (Neogit / Diffview)
    # -------------------------
    {
      mode = "n";
      key = "<leader>gs";
      action = ":Neogit<CR>";
      options.desc = "Git: Neogit status";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = ":DiffviewOpen<CR>";
      options.desc = "Git: Diffview open";
    }
    {
      mode = "n";
      key = "<leader>gD";
      action = ":DiffviewClose<CR>";
      options.desc = "Git: Diffview close";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = ":DiffviewFileHistory %<CR>";
      options.desc = "Git: File history (current file)";
    }
    {
      mode = "n";
      key = "<leader>gH";
      action = ":DiffviewFileHistory<CR>";
      options.desc = "Git: Repo history";
    }

    # -------------------------
    # Gitsigns (hunks / blame)
    # -------------------------
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns next_hunk<CR>";
      options.desc = "Git: Next hunk";
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns prev_hunk<CR>";
      options.desc = "Git: Previous hunk";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options.desc = "Git: Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>hs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options.desc = "Git: Stage hunk";
    }
    {
      mode = "n";
      key = "<leader>hr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options.desc = "Git: Reset hunk";
    }
    {
      mode = "n";
      key = "<leader>hS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options.desc = "Git: Stage buffer";
    }
    {
      mode = "n";
      key = "<leader>hR";
      action = "<cmd>Gitsigns reset_buffer<CR>";
      options.desc = "Git: Reset buffer";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      options.desc = "Git: Toggle blame (current line)";
    }
    {
      mode = "n";
      key = "<leader>hd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options.desc = "Git: Diff this";
    }
  ];
}
