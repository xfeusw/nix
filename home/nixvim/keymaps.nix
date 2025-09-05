# home/xfeusw/nixvim/keymaps.nix
{
  programs.nixvim.keymaps = [
    # General
    {
      action = "<cmd>w<CR>";
      key = "<leader>w";
      mode = "n";
      options.desc = "Save file";
    }
    {
      action = "<cmd>q<CR>";
      key = "<leader>q";
      mode = "n";
      options.desc = "Quit";
    }

    # Better scrolling
    {
      action = "<C-d>zz";
      key = "<C-d>";
      mode = "n";
      options.desc = "Scroll down and center";
    }
    {
      action = "<C-u>zz";
      key = "<C-u>";
      mode = "n";
      options.desc = "Scroll up and center";
    }

    # Stay in indent mode
    {
      action = "<gv";
      key = "<";
      mode = "v";
      options.desc = "Unindent line";
    }
    {
      action = ">gv";
      key = ">";
      mode = "v";
      options.desc = "Indent line";
    }

    # File explorer
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>e";
      mode = "n";
      options.desc = "Open file explorer";
    }

    # Telescope
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      mode = "n";
      options.desc = "Find files";
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
      mode = "n";
      options.desc = "Live grep";
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
      mode = "n";
      options.desc = "Find buffers";
    }
  ];
}
