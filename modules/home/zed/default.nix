{...}: {
  programs.zed-editor = {
    enable = true;

    # userKeymaps = import ./keymaps.nix {};

    userSettings = import ./settings.nix {};

    extensions = import ./extensions.nix;
  };
}
