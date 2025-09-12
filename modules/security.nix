# modules/security.nix
{ ... }:
{
  security = {
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };

    sudo.extraConfig = ''
      Defaults timestamp_timeout=30
      Defaults pwfeedback
    '';

    polkit.enable = true;
    rtkit.enable = true;
  };

  # Enhanced SSH configuration
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding = false;
      AllowTcpForwarding = "no";
      ClientAliveInterval = 300;
      ClientAliveCountMax = 2;
      MaxAuthTries = 3;
      Protocol = 2;
    };
    allowSFTP = false;
  };

  # Enhanced firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    logReversePathDrops = true;
    extraCommands = ''
      # Rate limiting for SSH
      iptables -A nixos-fw -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --set
      iptables -A nixos-fw -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
    '';
  };
}
