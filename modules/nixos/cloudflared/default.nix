{
  inputs,
  config,
  ...
}:
let
  sopsFile = ../../../secrets.yaml;
in
{
  sops = {
    age.keyFile = "/home/username/.config/sops/age/keys.txt";
    defaultSopsFile = sopsFile;

    secrets."cloudflared-creds" = {
      owner = "xfeusw";
      group = "users";
      mode = "0400";
    };
  };

  services.cloudflared = {
    enable = false;
    tunnels = {
      # tunnelcha
      "232cd80a-1e62-4575-9d9a-ce54e6c7040d" = {
        credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
        ingress = {
          "tunnelcha.uz" = "0.0.0.0:22";
        };

        default = "http_status:404";
      };
    };
  };
}
