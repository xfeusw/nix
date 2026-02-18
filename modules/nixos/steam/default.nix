{
  pkgs,
  lib,
  ...
}: {
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    steamcmd
    steam-run
    glibc
  ];

  networking = {
    firewall = {
      allowedUDPPortRanges = [
        {
          from = 27000;
          to = 28000;
        }
        {
          from = 4370;
          to = 4400;
        }
        {
          from = 1025;
          to = 65355;
        }
      ];
      allowedTCPPorts = [54120 80 27015];
      allowedUDPPorts = [9 80];
    };
    interfaces = {
      ens3 = {
        wakeOnLan.enable = true;
      };
    };
  };

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;
}
