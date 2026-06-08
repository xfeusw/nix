{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    package = pkgs.zed-editor-fhs;

    # userKeymaps = import ./keymaps.nix {};

    userSettings = import ./settings.nix { };

    extensions = import ./extensions.nix;
  };
}
