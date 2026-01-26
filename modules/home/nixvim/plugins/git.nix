{
  programs.nixvim.plugins = {
    lazygit.enable = true;

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
      };
    };
  };
}
