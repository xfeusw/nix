{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      keymaps = {
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fr" = "oldfiles";
        "<leader>fc" = "commands";
        "<leader>fk" = "keymaps";
        "<leader>fd" = "diagnostics";
        "<leader>u" = ":UndotreeToggle<CR>";
        "<C-p>" = {
          action = "git_files";
          options = {
            desc = "Telescope Git Files";
          };
        };
      };
      extensions.fzf-native = {
        enable = true;
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]";
        direction = "float";
        float_opts = {
          border = "curved";
        };
      };
    };

    harpoon = {
      enable = true;
      enableTelescope = true;
    };

    markdown-preview = {
      enable = true;
      settings.theme = "dark";
    };

    comment = {
      enable = true;
      settings = {
        line = "gcc";
        block = "gbc";
      };
      opleader = {
        line = "gc";
        block = "gb";
      };
    };

    flash = {
      enable = true;
      modes.search.enabled = true;
    };

    nvim-surround.enable = true;

    undotree = {
      enable = true;
      settings = {
        focusOnToggle = true;
      };
    };
  };
}
