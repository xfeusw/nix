{ config, pkgs, ... }:

{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;

    extraConfig.pipewire."98-bluetooth-stability" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 512;
        "default.clock.min-quantum" = 128;
        "default.clock.max-quantum" = 1024;
      };
    };

    wireplumber.extraConfig = {
      "11-bluetooth-policy" = {
        "wireplumber.settings" = {
          "bluetooth.autoswitch-to-headset-profile" = false;
        };
      };
    };
  };
}
