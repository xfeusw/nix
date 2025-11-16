{ config, ... }: {
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        backend = "pulseaudio";
        device_name = "nixos-acer";
        volume_controller = "softvol";
        cache_path = "${config.xdg.cacheHome}/spotifyd";
        bitrate = 320;
        # username = "youremail@example.com";
        # password_cmd = "cat /run/keys/spotify_pass";
      };
    };
  };
}
