{ pkgs, config, ... }: {
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        backend = "pulseaudio";
        device_name = "nixos-acer";
        volume_controller = "softvol";
        cache_path = "${config.xdg.cacheHome}/spotifyd";
        bitrate = 320;
        username_cmd = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.spotify-username.path}";
        password_cmd = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.spotify-password.path}";
      };
    };
  };
}
