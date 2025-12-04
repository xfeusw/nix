{lib, ...}: {
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  services = {
    accounts-daemon.enable = lib.mkForce true;
    geoclue2.enable = false;
    fwupd.enable = false;
  };

  rtmpServer.enable = true;

  # 2. Add the main RTMP configuration block to NGINX
  services.nginx.nginxExtraConfig = ''
    rtmp {
        server {
            listen 1935;
            chunk_size 4096;

            application live {
                live on;
                record off;
                # Allow streaming from all IPs
                allow publish all;
            }
        }
    }
  '';
}
