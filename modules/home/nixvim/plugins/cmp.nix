{
  programs.nixvim.plugins = {
    luasnip.enable = true;
    cmp-buffer.enable = true;
    cmp-emoji.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;

    cmp = {
      enable = true;
      autoLoad = true;
      autoEnableSources = true;
    };
  };
}
