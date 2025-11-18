{ pkgs, config, ... }: {
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        backend = "pulseaudio";
        device_name = "xeon";
        volume_controller = "softvol";
        cache_path = "${config.xdg.cacheHome}/spotifyd";
        bitrate = 320;
      };
    };
  };
}
