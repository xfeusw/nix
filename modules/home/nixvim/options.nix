{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;
      signcolumn = "yes";
      updatetime = 300;
      timeoutlen = 500;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      termguicolors = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = "m";
    };

    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
        xclip.enable = true;
      };
    };

    autocmd = [
      {
        event = "BufWritePre";
        pattern = ["*.rs"];
        callback.__raw = ''
          function()
            vim.lsp.buf.format({ async = false })
          end
        '';
      }
      {
        event = "BufWritePre";
        pattern = [
          "*.hs"
          "*.lhs"
        ];
        callback.__raw = ''
          function()
            vim.lsp.buf.format({ async = false })
          end
        '';
      }
      {
        event = "BufWritePre";
        pattern = ["*.nix"];
        callback.__raw = ''
          function()
            vim.lsp.buf.format({ async = false })
          end
        '';
      }
    ];

    diagnostics = {
      virtual_text = {
        spacing = 4;
        prefix = "●";
      };
      signs = true;
      update_in_insert = false;
      underline = true;
      severity_sort = true;
      float = {
        focusable = false;
        style = "minimal";
        border = "rounded";
        source = "always";
        header = "";
        prefix = "";
      };
    };
  };
}
