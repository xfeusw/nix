{
  inputs,
  config,
  ...
}:
let
  sopsFile = ../../../../secrets.yaml;
  creds = builtins.readFile config.sops.secrets.cloudflared-creds.path;
in
{
  sops = {
    age.keyFile = "/home/xfeusw/.config/sops/age/keys.txt";
    defaultSopsFile = sopsFile;

    secrets."cloudflared-creds" = {
      owner = "xfeusw";
      group = "users";
      mode = "0400";
    };
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      # tunnelcha
      "db931588-3832-4abf-a6c9-8b9d2920e566" = {
        # credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
        credentialsFile = creds;
        ingress = {
          "ssh.tunnelcha.uz" = "ssh://localhost:22";
        };

        default = "http_status:404";
      };
    };
  };
}
