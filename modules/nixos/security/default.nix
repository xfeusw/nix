{
  pkgs,
  config,
  lib,
  ...
}: {
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

  # System security hardening (MERGED BOOT BLOCK)
  boot = {
    kernel.sysctl = {
      "kernel.sysrq" = 0;
      "net.ipv4.ip_forward" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.all.log_martians" = 1;
      "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
      "net.ipv4.tcp_syncookies" = 1;
      "kernel.dmesg_restrict" = 1;
      "kernel.kptr_restrict" = 2;
      "kernel.yama.ptrace_scope" = 1;
    };

    kernelParams = [
      "slab_nomerge"
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "randomize_kstack_offset=on"
      "vsyscall=none"
      "lockdown=confidentiality"
    ];

    blacklistedKernelModules = [
      "dccp"
      "sctp"
      "rds"
      "tipc"
      "jffs2"
      "hfs"
      "hfsplus"
      "firewire-core"
      "thunderbolt"
    ];
  };

  # Security tools
  environment.systemPackages = with pkgs; [
    lynis
    nmap
    wireshark
    tcpdump
  ];

  # Audit framework
  security.auditd.enable = false;
  security.audit = {
    enable = false;
    # rules = [
    #   "-w /etc/passwd -p wa -k identity"
    #   "-w /etc/shadow -p wa -k identity"
    #   "-w /etc/sudoers -p wa -k identity"
    #   "-a always,exit -F arch=b64 -S execve -k exec"
    # ];
  };
}
