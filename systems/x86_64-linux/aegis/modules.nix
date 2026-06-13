{
  inputs,
  config,
  pkgs,
  lib,
  system,
  ...
}:
{

  services.flatpak.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.pipewire.jack.enable = true;
  services.printing.enable = true;

  # Select internationalisation properties.
  modules.xinux.language = "en_US.UTF-8";
  modules.xinux.binaryCompat.enable = true;
  modules.graphical.provider = "intel";
  modules.packagemanagers.appimage.enable = true;
  modules.gnome.remove-utils.enable = true;
  modules.xinux.browser = "zen";
  modules.shell.direnv = true;
  modules.shell.starship = true;
  modules.shell.rusted-tools = true;
}
