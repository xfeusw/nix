{
  pkgs,
  lib,
  ...
}: let
  customPath = "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/";
  ghostty = customPath + "ghostty";
in {
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        ghostty
      ];
    };

    "${ghostty}" = {
      binding = "<Super>t";
      command = "ghostty";
      name = " open-ghostty";
    };
  };
}
