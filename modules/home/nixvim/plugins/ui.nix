{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    rainbow-delimiters.enable = true;
    nvim-autopairs.enable = true;
    bufferline.enable = true;
    which-key.enable = true;

    lightline = {
      enable = true;
      settings = {
        colorscheme = "tokyonight";
      };
    };

    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          smart_indent_cap = true;
          char = " ";
        };
        scope = {
          enabled = true;
          char = "|";
        };
      };
    };

    nvim-tree = {
      enable = true;
      openOnSetupFile = true;
      settings.auto_reload_on_write = true;
    };

    wilder = {
      enable = true;
      settings.modes = [":" "/" "?"];
    };
  };
}
