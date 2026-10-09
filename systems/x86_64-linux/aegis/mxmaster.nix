{ config, pkgs, ... }:

{
  hardware.logitech.wireless.enable = true;

  services.logiops = {
    enable = true;
    config = {
      devices = [
        # {
        #   name = "MX Keys for Business";
        #   buttons = [
        #     {
        #       cid = (fromTOML "hex = 0x0103").hex; # Dictation / Fn+F5
        #       action = {
        #         type = "Keypress";
        #         keys = [ "KEY_DICTATE" ];
        #       };
        #     }
        #     {
        #       cid = (fromTOML "hex = 0x0108").hex; # Emoji / Fn+F6
        #       action = {
        #         type = "Keypress";
        #         keys = [ "KEY_EMOJI_PICKER" ];
        #       };
        #     }
        #     {
        #       cid = (fromTOML "hex = 0x011C").hex; # Mic Mute /Fn+F7
        #       action = {
        #         type = "Keypress";
        #         keys = [ "KEY_MICMUTE" ];
        #       };
        #     }
        #     {
        #       cid = (fromTOML "hex = 0x010A").hex; # Screenshot / Print screen
        #       action = {
        #         type = "Keypress";
        #         keys = [ "KEY_PRINT" ];
        #       };
        #     }
        #     {
        #       cid = (fromTOML "hex = 0x006F").hex; # Lock screen / Numpad padlock
        #       action = {
        #         type = "Keypress";
        #         keys = [ "KEY_SCREENSAVER" ];
        #       };
        #     }
        #   ];
        # }

        # {
        #   name = "MX Vertical Advanced Ergonomic Mouse";
        #   dpi = 1500; # max=4000
        #   hiresscroll = {
        #     hires = true;
        #     invert = false;
        #     target = true;
        #   };
        #   # buttons = [{}];
        # }
      ];
    };
  };

  services.udev.extraRules = ''
    ACTION == "remove", GOTO="solaar_end"
    SUBSYSTEM != "hidraw", GOTO="solaar_end"

    ATTRS{idVendor}=="046d", GOTO="solaar_apply"
    ATTRS{idVendor}=="17ef", ATTRS{idProduct}=="6042", GOTO="solaar_apply"

    KERNELS == "0005:046D:*", GOTO="solaar_apply"

    GOTO="solaar_end"

    LABEL="solaar_apply"
    TAG+="uaccess"

    LABEL="solaar_end"
  '';
}
