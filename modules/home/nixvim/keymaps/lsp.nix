{
  programs.nixvim.keymaps = [
    # Format buffer
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>lua vim.lsp.buf.format({ async = false })<CR>";
      options.desc = "Format buffer";
    }

    # Clear search highlighting
    {
      mode = "n";
      key = "<leader>h";
      action = ":nohlsearch<CR>";
      options.desc = "Clear search highlight";
    }

    # Diagnostics
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      options.desc = "Show line diagnostics";
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      options.desc = "Previous diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      options.desc = "Next diagnostic";
    }

    # Code actions
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options.desc = "Code actions";
    }
    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options.desc = "Rename symbol";
    }
  ];
}
