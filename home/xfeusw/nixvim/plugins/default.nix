# home/xfeusw/nixvim/plugins/default.nix
{
  programs.nixvim.plugins = {
    # File management
    oil.enable = true;

    # Status line
    lualine = {
      enable = true;
      theme = "catppuccin";
    };

    # Syntax highlighting
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    # Fuzzy finder
    telescope = {
      enable = true;
      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^node_modules/"
          "^.direnv/"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };

    # Git integration
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "│";
          change.text = "│";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
      };
    };

    # LSP
    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true; # Nix
        lua-ls.enable = true; # Lua
        tsserver.enable = true; # TypeScript/JavaScript
      };
    };

    # Autocompletion
    cmp = {
      enable = true;
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end, { "i", "s" })
          '';
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };

    # Essential editing
    comment.enable = true;
    nvim-surround.enable = true;
    nvim-autopairs.enable = true;

    # Which-key for help
    which-key = {
      enable = true;
      settings.spec = [
        { __unkeyed-1 = "<leader>f"; group = "Find"; }
        { __unkeyed-1 = "<leader>g"; group = "Git"; }
      ];
    };
  };
}
