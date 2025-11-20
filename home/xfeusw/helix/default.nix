{
  config,
  lib,
  pkgs,
  ...
}: let
  settings = import ./settings.nix;
  keybindings = import ./keybindings.nix;
  languages = import ./languages.nix {inherit pkgs;};
  packages = import ./packages.nix {inherit pkgs;};
in {
  options.programs.helix.installExtraPackages = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Whether to install extra packages (LSPs, formatters, etc.)";
  };

  config = {
    programs.helix = {
      enable = true;
      settings =
        settings
        // {
          keys = keybindings;
        };
      inherit languages;
    };

    home.packages = lib.mkIf config.programs.helix.installExtraPackages packages;
  };
}
