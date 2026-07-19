{
  disko.devices = {
    disk = {
      nvme0n1 = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            BOOT = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "umask=0077"
                ];
              };
            };
            # SWAP = {
            #   size = "33G";
            #   content = {
            #     type = "swap";
            #     resumeDevice = true;
            #     discardPolicy = "both";
            #   };
            # };
            ROOT = {
              size = "475G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
  boot.initrd.systemd.enable = true;
}
