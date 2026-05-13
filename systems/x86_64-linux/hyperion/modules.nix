{ inputs, config, pkgs, lib, system, ... }:
{



  services.flatpak.enable = true;
  services.pipewire.jack.enable = true;

  # Select internationalisation properties.
  modules.xinux.language = "en_US.UTF-8";
  modules.graphical.provider = "intel";
  modules.packagemanagers.appimage.enable = true;
  modules.gnome.removeUtils.enable = true;
  modules.xinux.browser = "zen";
  modules.shell.direnv = true;
}
