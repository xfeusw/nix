# home/xfeusw/nixvim/plugins/default.nix
{
  programs.nixvim.plugins = {
    # File management
    oil.enable = true;
    
    # FIXED: Status line configuration
    lualine = {
      enable = true;
      settings.options.theme = "catppuccin"; # FIXED: Moved to settings.options.theme
    };
    
    # Syntax highlighting
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    # FIXED: Explicitly enable web-devicons to remove deprecation warning
    web-devicons.enable = true;

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

    # FIXED: LSP with correct server names
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;    # FIXED: nil-ls -> nil_ls
        lua_ls.enable = true;    # FIXED: lua-ls -> lua_ls  
        ts_ls.enable = true;     # FIXED: tsserver -> ts_ls
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