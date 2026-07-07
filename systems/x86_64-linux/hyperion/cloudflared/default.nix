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
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

  users.users.xfeusw = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIs+UWqdTDRJVG5XfDcGAlA1fvDXFvPbUtRTGQV/Ob9H xfeusw@hyperion"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGhrOip78ANJVzXwAfVEK5Ng0Rgvvt9+eV+nOu5df4ra xfeusw@aegis"
    ];
  };

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
        credentialsFile = creds;
        ingress = {
          "ssh.tunnelcha.uz" = "ssh://localhost:22";
        };

        default = "http_status:404";
      };
    };
  };
}
