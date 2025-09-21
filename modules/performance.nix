# modules/performance.nix
{ ... }:
{
  # Memory and swap optimization
  zramSwap = {
    enable = true;
    memoryPercent = 25;  # Reduced from 50%
    algorithm = "zstd";  # Better compression
  };

  # Kernel optimizations for performance
  boot.kernel.sysctl = {
    # Memory management
    "vm.swappiness" = 1;
    "vm.dirty_ratio" = 3;
    "vm.dirty_background_ratio" = 1;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_writeback_centisecs" = 1500;
    "vm.dirty_expire_centisecs" = 3000;

    # Network optimizations
    "net.core.rmem_max" = 134217728;
    "net.core.wmem_max" = 134217728;
    "net.core.netdev_max_backlog" = 5000;
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_rmem" = "4096 12582912 16777216";
    "net.ipv4.tcp_wmem" = "4096 12582912 16777216";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_slow_start_after_idle" = 0;

    # File system optimizations
    "fs.file-max" = 2097152;
    "fs.inotify.max_user_watches" = 524288;
  };

  # More conservative auto-upgrade
  system.autoUpgrade = {
    enable = true;
    flake = "/home/xfeusw/.config/nix";
    dates = "weekly";  # Changed from daily
    randomizedDelaySec = "2h";
    allowReboot = false;  # Safety: don't auto-reboot
  };

  # SSD optimizations
  services = {
    fstrim = {
      enable = true;
      interval = "daily";
    };

    # Disable write barriers for better SSD performance (if using ext4)
    # Note: This sacrifices some data safety for performance
    # Remove if you prefer safety over speed
  };

  # Power management for better performance/battery balance
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";  # Better than ondemand
  };
}
