# home/xfeusw/nixvim/default.nix
{ pkgs, ... }:
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
    clipboard.providers.wl-copy.enable = true; # For Wayland
    # clipboard.providers.xclip.enable = true; # For X11 (uncomment if needed)

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

    # Extra packages available to nixvim
    extraPackages = with pkgs; [
      # Language servers
      nil # Nix LSP
      lua-language-server
      nodePackages.typescript-language-server
      python3Packages.python-lsp-server

      # Formatters
      alejandra # Nix formatter
      stylua # Lua formatter
      prettier # JS/TS/JSON formatter

      # Tools for telescope
      ripgrep
      fd
    ];
  };
}
