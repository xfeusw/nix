{}: let
  customPath = "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/";
  ghostty = customPath + "ghostty";
in {
  dconf.setttings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        ghostty
      ];
    };

    ghostty = {
      binding = "<Super><Return>";
      command = "ghostty";
      name = " open-ghostty";
    };
  };
}
