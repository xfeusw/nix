{
  inputs,
  config,
  ...
}:
{

  sops = {
    age.keyFile = "/home/username/.config/sops/age/keys.txt";
    defaultSopsFile = secrets/secrets.yaml;

    secrets."cloudflared-creds" = {
      owner = "username";
      group = "users";
      mode = "0400";
    };
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "eyJhIjoiMTQ0ZDkyNjE5ZmVlZmQ0MTIwYjU5OTEzY2RmNDcyMWEiLCJ0IjoiMjMyY2Q4MGEtMWU2Mi00NTc1LTlkOWEtY2U1NGU2YzcwNDBkIiwicyI6Ik1HRXdNR0U1TVRBdE9XVXlZeTAwTTJVeExUaGhOREV0TkRobE1HUTJNMkk1TjJJMCJ9" =
        {
          credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
          ingress = {
            "tunnelcha.uz" = "0.0.0.0:22";
          };

          default = "http_status:404";
        };
    };
  };
}
