{
  inputs,
  config,
  ...
}:
let
  sopsFile = ../../../../secrets.yaml;
  # creds = builtins.readFile config.sops.secrets.cloudflared-creds.path;
  creds = /home/xfeusw/.cloudflared/8e83e725-c041-4bd2-8bbe-4777f8e3aa2b.json;
in
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      Protocol = 2;
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "xfeusw" ];
      MaxAuthTries = 3;
      UsePAM = true;
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
      "8e83e725-c041-4bd2-8bbe-4777f8e3aa2b" = {
        credentialsFile = creds;
        ingress = {
          "ssh.tunnelcha.uz" = "ssh://localhost:22";
        };

        default = "http_status:404";
      };
    };
  };
}
