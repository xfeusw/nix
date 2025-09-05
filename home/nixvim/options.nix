# home/xfeusw/nixvim/options.nix
{
  programs.nixvim.options = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Indentation
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;
    smartindent = true;

    # Search
    hlsearch = false;
    incsearch = true;
    ignorecase = true;
    smartcase = true;

    # Appearance
    termguicolors = true;
    signcolumn = "yes";
    cmdheight = 1;
    scrolloff = 8;
    sidescrolloff = 8;
    cursorline = true;

    # Behavior
    hidden = true;
    swapfile = false;
    backup = false;
    undofile = true;
    mouse = "a";
    splitbelow = true;
    splitright = true;
    wrap = false;

    # Performance
    updatetime = 300;
    timeoutlen = 500;
  };
}
