{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    nvim-autopairs.enable = true;
    bufferline.enable = true;
    which-key.enable = true;

    rainbow-delimeters = {
      enable = true;
      highlight = [
        "RainbowDelimiterRed"
        "RainbowDelimiterYellow"
        "RainbowDelimiterBlue"
        "RainbowDelimiterOrange"
        "RainbowDelimiterGreen"
        "RainbowDelimiterViolet"
        "RainbowDelimiterCyan"
      ];
    };

    lualine = {
      enable = true;
      theme = "tokyonight";
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          "branch"
          "diff"
          "diagnostics"
        ];
        lualine_c = ["filename"];
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
        ];
        lualine_y = ["progress"];
        lualine_z = ["location"];
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
      settings.modes = [
        ":"
        "/"
        "?"
      ];
    };
  };
}
