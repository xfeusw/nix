{ pkgs, ... }:
{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    sysprof.enable = true;
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus
    sysprof
    adwaita-icon-theme
    gnome2.GConf
    papirus-icon-theme
  ];

  hardware.sensor.iio.enable = true;
  systemd.targets.sleep.enable = true;
  systemd.targets.suspend.enable = true;
  systemd.targets.hibernate.enable = true;
  systemd.targets.hybrid-sleep.enable = true;
}
