{
  programs.nixvim.keymaps = [
    # Duplicate lines up/down
    {
      mode = "n";
      key = "<leader>j";
      action = ":t.<CR>";
      options.desc = "Duplicate line down";
    }
    {
      mode = "n";
      key = "<leader>k";
      action = ":t.-1<CR>";
      options.desc = "Duplicate line up";
    }
    {
      mode = "v";
      key = "<leader>j";
      action = ":t'><CR>gv";
      options.desc = "Duplicate selection down";
    }
    {
      mode = "v";
      key = "<leader>k";
      action = ":t'<-1<CR>gv";
      options.desc = "Duplicate selection up";
    }

    # Move lines up/down
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move selection down";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move selection up";
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Indent left";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent right";
    }

    # Delete without yanking
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>d";
      action = "\"_d";
      options.desc = "Delete without yanking";
    }

    # Paste without yanking deleted text
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options.desc = "Paste without yanking";
    }

    # Join lines but keep cursor position
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options.desc = "Join lines (keep cursor)";
    }

    # Quick save
    {
      mode = "n";
      key = "<leader>w";
      action = ":w<CR>";
      options.desc = "Save file";
    }
    {
      mode = "n";
      key = "<leader>W";
      action = ":wa<CR>";
      options.desc = "Save all files";
    }

    # Quick quit
    {
      mode = "n";
      key = "<leader>q";
      action = ":q<CR>";
      options.desc = "Quit";
    }
    {
      mode = "n";
      key = "<leader>Q";
      action = ":qa<CR>";
      options.desc = "Quit all";
    }

    # Select all
    {
      mode = "n";
      key = "<leader>a";
      action = "ggVG";
      options.desc = "Select entire file";
    }

    # Better line start/end
    {
      mode = [
        "n"
        "v"
      ];
      key = "H";
      action = "^";
      options.desc = "Go to first non-blank character";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "L";
      action = "$";
      options.desc = "Go to end of line";
    }

    # Increment/decrement numbers
    {
      mode = "n";
      key = "+";
      action = "<C-a>";
      options.desc = "Increment number";
    }
    {
      mode = "n";
      key = "-";
      action = "<C-x>";
      options.desc = "Decrement number";
    }
  ];
}
