# home/xfeusw/nixvim/default.nix
{ pkgs, unstable, ... }:
{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Clipboard integration
    clipboard.providers.wl-copy.enable = true;

    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = false;
        integrations = {
          cmp = true;
          gitsigns = true;
          telescope.enabled = true;
          treesitter = true;
          which_key = true;
        };
      };
    };

    # FIXED: Use correct package references
    extraPackages = with pkgs; [
      # Language servers
      nil # Nix LSP
      lua-language-server
      nodePackages.typescript-language-server
      python3Packages.python-lsp-server
      
      # Formatters - FIXED: Use correct prettier package
      alejandra # Nix formatter
      stylua # Lua formatter
      nodePackages.prettier # FIXED: Full package path
      
      # Tools for telescope
      ripgrep
      fd
    ];
  };
}