{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };
  };
}
