{ config, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    secrets.gh_token = {
      mode = "0400";
      path = "${config.home.homeDirectory}/.config/sops-nix/gh_token";
    };
  };
}
