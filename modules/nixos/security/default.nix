{
  pkgs,
  config,
  lib,
  ...
}:
{
  # security = {
  #   apparmor = {
  #     enable = true;
  #     killUnconfinedConfinables = true;
  #     packages = with pkgs; [
  #       apparmor-profiles
  #     ];
  #   };

  #   sudo = {
  #     extraConfig = ''
  #       Defaults timestamp_timeout=15
  #       Defaults pwfeedback
  #       Defaults lecture=always
  #       Defaults logfile=/var/log/sudo.log
  #       Defaults log_input,log_output
  #       Defaults insults
  #     '';
  #   };

  #   polkit.enable = true;
  #   rtkit.enable = true;
  # };

  # # Fail2ban for intrusion prevention
  # services.fail2ban = {
  #   enable = true;
  #   maxretry = 3;
  #   bantime = "1h";
  #   bantime-increment = {
  #     enable = true;
  #     maxtime = "168h";
  #     factor = "2";
  #   };

  #   jails = {
  #     ssh = ''
  #       enabled = true
  #       port = 22
  #       filter = sshd
  #       logpath = /var/log/auth.log
  #       maxretry = 3
  #       bantime = 3600
  #     '';
  #   };
  # };

  # Enhanced SSH configuration
  services.openssh = {
    enable = true;
    allowSFTP = true;
  };

  # Enhanced firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      8080
      39393
      5000
      1935
    ];
  };

  # Security tools
  environment.systemPackages = with pkgs; [
    lynis
    nmap
    wireshark
    tcpdump
  ];
}
