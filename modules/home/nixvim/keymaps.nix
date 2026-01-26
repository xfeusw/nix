{
  programs.nixvim = {
    keymaps = [
      # Window navigation - Move between splits
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Move to left window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Move to bottom window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Move to top window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Move to right window";
        };
      }

      # Window splits - Create new splits
      {
        mode = "n";
        key = "<leader>sv";
        action = ":vsplit<CR>";
        options = {
          desc = "Split window right";
        };
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = ":split<CR>";
        options = {
          desc = "Split window below";
        };
      }
      {
        mode = "n";
        key = "<leader>sx";
        action = ":close<CR>";
        options = {
          desc = "Close current split";
        };
      }
      {
        mode = "n";
        key = "<leader>so";
        action = ":only<CR>";
        options = {
          desc = "Close all other splits";
        };
      }

      # Duplicate lines up/down
      {
        mode = "n";
        key = "<leader>j";
        action = ":t.<CR>";
        options = {
          desc = "Duplicate line down";
        };
      }
      {
        mode = "n";
        key = "<leader>k";
        action = ":t.-1<CR>";
        options = {
          desc = "Duplicate line up";
        };
      }
      {
        mode = "v";
        key = "<leader>j";
        action = ":t'><CR>gv";
        options = {
          desc = "Duplicate selection down";
        };
      }
      {
        mode = "v";
        key = "<leader>k";
        action = ":t'<-1<CR>gv";
        options = {
          desc = "Duplicate selection up";
        };
      }

      # Move lines up/down in visual mode
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move selection down";
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          desc = "Move selection up";
        };
      }

      # Better indenting - Stay in visual mode after indent
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          desc = "Indent left";
        };
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          desc = "Indent right";
        };
      }

      # Clear search highlighting
      {
        mode = "n";
        key = "<leader>h";
        action = ":nohlsearch<CR>";
        options = {
          desc = "Clear search highlight";
        };
      }

      # Format buffer with LSP
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua vim.lsp.buf.format({ async = false })<CR>";
        options = {
          desc = "Format buffer";
        };
      }

      # Select entire file
      {
        mode = "n";
        key = "<leader>a";
        action = "ggVG";
        options = {
          desc = "Select entire file";
        };
      }

      # Copy entire file to clipboard
      {
        mode = "n";
        key = "<leader>y";
        action = ":%y+<CR>";
        options = {
          desc = "Copy entire file";
        };
      }

      # Toggle undo tree
      {
        mode = "n";
        key = "<leader>u";
        action = ":UndotreeToggle<CR>";
        options = {
          desc = "Toggle undo tree";
        };
      }

      # Theme switching - Tokyo Night variants
      {
        mode = "n";
        key = "<leader>tn";
        action = ":lua vim.cmd('colorscheme tokyonight-night')<CR>";
        options = {
          desc = "Tokyo Night (night)";
        };
      }
      {
        mode = "n";
        key = "<leader>ts";
        action = ":lua vim.cmd('colorscheme tokyonight-storm')<CR>";
        options = {
          desc = "Tokyo Night (storm)";
        };
      }
      {
        mode = "n";
        key = "<leader>td";
        action = ":lua vim.cmd('colorscheme tokyonight-day')<CR>";
        options = {
          desc = "Tokyo Night (day)";
        };
      }
      {
        mode = "n";
        key = "<leader>tm";
        action = ":lua vim.cmd('colorscheme tokyonight-moon')<CR>";
        options = {
          desc = "Tokyo Night (moon)";
        };
      }

      # Theme switching - Other colorschemes
      {
        mode = "n";
        key = "<leader>tg";
        action = ":colorscheme gruvbox<CR>";
        options = {
          desc = "Gruvbox";
        };
      }
      {
        mode = "n";
        key = "<leader>tc";
        action = ":colorscheme catppuccin<CR>";
        options = {
          desc = "Catppuccin";
        };
      }
      {
        mode = "n";
        key = "<leader>to";
        action = ":colorscheme onedark<CR>";
        options = {
          desc = "OneDark";
        };
      }
      {
        mode = "n";
        key = "<leader>tk";
        action = ":colorscheme kanagawa<CR>";
        options = {
          desc = "Kanagawa";
        };
      }
    ];
  };
}
