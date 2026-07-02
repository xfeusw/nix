{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

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
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
      };
    };
  };
}
