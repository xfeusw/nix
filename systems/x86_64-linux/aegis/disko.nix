{
  disko.devices = {
    disk = {
      nvme0n1 = {
        content = {
          partitions = {
            nvme0n11 = {
              content = {
                format = "vfat";
                mountOptions = [
                  "umask=0077"
                ];
                mountpoint = "/boot";
                type = "filesystem";
              };
              size = "1G";
              type = "EF00";
            };
            nvme0n12 = {
              content = {
                content = {
                  resumeDevice = true;
                  type = "swap";
                };
                name = "crypted-nvme0n12";
                passwordFile = "/run/xeonitte-luks.key";
                settings = {
                  allowDiscards = true;
                };
                type = "luks";
              };
              size = "33G";
            };
            nvme0n13 = {
              content = {
                content = {
                  format = "ext4";
                  mountpoint = "/";
                  type = "filesystem";
                };
                name = "crypted-nvme0n13";
                passwordFile = "/run/xeonitte-luks.key";
                settings = {
                  allowDiscards = true;
                };
                type = "luks";
              };
              size = "440G";
            };
          };
          type = "gpt";
        };
        device = "/dev/nvme0n1";
      };
    };
  };
  boot.initrd.systemd.enable = true;
}

