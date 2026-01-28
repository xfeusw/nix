{
  programs.nixvim.plugins = {
    neogit = {
      enable = true;
      settings = {
        integrations = {
          telescope = true;
          diffview = true;
        };
      };
    };

    diffview.enable = true;

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
      };
    };
  };
}
