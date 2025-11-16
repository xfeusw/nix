{lib, ...}: {
  # Use zram swap — safe system-wide default
  zramSwap = {
    enable = lib.mkDefault true;
    memoryPercent = lib.mkDefault 100;
    algorithm = lib.mkDefault "zstd";
  };

  # Kernel-level tuning
  boot.kernel.sysctl = lib.mkMerge [
    {
      "vm.swappiness" = lib.mkDefault 10;
      "vm.vfs_cache_pressure" = lib.mkDefault 50;
      "vm.dirty_ratio" = lib.mkDefault 5;
      "vm.dirty_background_ratio" = lib.mkDefault 2;
      "vm.dirty_writeback_centisecs" = lib.mkDefault 1500;
      "vm.dirty_expire_centisecs" = lib.mkDefault 3000;

      # Network tuning
      "net.core.default_qdisc" = lib.mkDefault "fq";
      "net.ipv4.tcp_congestion_control" = lib.mkDefault "bbr";
      "net.core.rmem_max" = lib.mkDefault 134217728;
      "net.core.wmem_max" = lib.mkDefault 134217728;
      "net.ipv4.tcp_rmem" = lib.mkDefault "4096 12582912 16777216";
      "net.ipv4.tcp_wmem" = lib.mkDefault "4096 12582912 16777216";
      "net.core.netdev_max_backlog" = lib.mkDefault 5000;
      "net.ipv4.tcp_fastopen" = lib.mkDefault 3;
      "net.ipv4.tcp_slow_start_after_idle" = lib.mkDefault 0;

      # Filesystem tuning
      "fs.file-max" = lib.mkDefault 2097152;
      "fs.inotify.max_user_watches" = lib.mkForce 524288;
    }
  ];

  # Auto system updates
  system.autoUpgrade = {
    enable = lib.mkDefault true;
    flake = lib.mkDefault "/home/xfeusw/.config/nix";
    dates = lib.mkDefault "weekly";
    randomizedDelaySec = lib.mkDefault "2h";
    allowReboot = lib.mkDefault false;
  };

  # SSD trimming
  services.fstrim.enable = lib.mkDefault true;

  # CPU and power
  powerManagement = {
    enable = lib.mkDefault true;
    cpuFreqGovernor = lib.mkDefault "schedutil";
  };
}
