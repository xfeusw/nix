{pkgs, ...}: {
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    udev.packages = with pkgs; [gnome-settings-daemon];
    sysprof.enable = true;
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus
    sysprof
    adwaita-icon-theme
    gnome2.GConf
  ];

  hardware.sensor.iio.enable = true;
}
