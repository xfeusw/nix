{ pkgs, ... }:
{
  home = {
    stateVersion = "26.11";
    username = "xfeusw";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    settings = {
      "ssh.tunnelcha.uz" = {
        Hostname = "ssh.tunnelcha.uz";
        User = "xfeusw";
        ProxyCommand = "cloudflared access ssh --hostname %h";
      };
    };
  };
}
