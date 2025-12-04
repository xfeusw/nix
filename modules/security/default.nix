{
  pkgs,
  config,
  lib,
  ...
}: {
  security = {
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
      packages = with pkgs; [
        apparmor-profiles
      ];
    };

    sudo = {
      extraConfig = ''
        Defaults timestamp_timeout=15
        Defaults pwfeedback
        Defaults lecture=always
        Defaults logfile=/var/log/sudo.log
        Defaults log_input,log_output
        Defaults insults
      '';
    };

    polkit.enable = true;
    rtkit.enable = true;
  };

  # Fail2ban for intrusion prevention
  services.fail2ban = {
    enable = true;
    maxretry = 3;
    bantime = "1h";
    bantime-increment = {
      enable = true;
      maxtime = "168h";
      factor = "2";
    };

    jails = {
      ssh = ''
        enabled = true
        port = 22
        filter = sshd
        logpath = /var/log/auth.log
        maxretry = 3
        bantime = 3600
      '';
    };
  };

  # Enhanced SSH configuration
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PubkeyAuthentication = true;
      X11Forwarding = false;
      AllowTcpForwarding = "no";
      AllowAgentForwarding = false;
      ClientAliveInterval = 300;
      ClientAliveCountMax = 2;
      MaxAuthTries = 3;
      MaxStartups = "10:30:100";
      LoginGraceTime = 30;
      Ciphers = [
        "chacha20-poly1305@openssh.com"
        "aes256-gcm@openssh.com"
        "aes128-gcm@openssh.com"
      ];
      KexAlgorithms = [
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
      ];
      Macs = [
        "hmac-sha2-256-etm@openssh.com"
        "hmac-sha2-512-etm@openssh.com"
      ];
    };
    allowSFTP = false;
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
    allowPing = false;
    logReversePathDrops = true;
    logRefusedConnections = true;

    extraCommands = ''
      # SSH rate limiting
      iptables -A nixos-fw -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --set --name SSH
      iptables -A nixos-fw -p tcp --dport 22 -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 3 --name SSH -j DROP

      # Drop invalid packets
      iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
    '';
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
  security.auditd.enable = true;
  security.audit = {
    enable = true;
    rules = [
      "-w /etc/passwd -p wa -k identity"
      "-w /etc/shadow -p wa -k identity"
      "-w /etc/sudoers -p wa -k identity"
      "-a always,exit -F arch=b64 -S execve -k exec"
    ];
  };

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.users.users.xfeusw.home}/.config/sops/age/keys.txt";
    secrets = {
      gh_token = {
        owner = "xfeusw";
        mode = "0400";
      };
    };
  };
}
