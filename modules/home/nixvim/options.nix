{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = false;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
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
  };
}
