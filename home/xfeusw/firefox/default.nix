{
  config,
  pkgs,
  ...
}: let
  # For using addons
  # addon = pkgs.firefox-addons.buildFirefoxXpiAddon;
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    # profiles = {
    #   default = {
    #     id = 0;
    #     name = "default";
    #     isDefault = true;
    #   };
    # };
  };
}
