{ config, ... } :
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.users.users.xfeusw.home}/.config/sops/age/keys.txt";
    secrets = {
      gh_token = {
        owner = "xfeusw";
        mode = "0400";
      };
      spotify-username = {
        owner = "xfeusw";
        mode = "0400";
      };
      spotify-password = {
        owner = "xfeusw";
        mode = "0400";
      };
    };
  };
}
