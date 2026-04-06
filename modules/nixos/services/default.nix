{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "grp:win_space_toggle";
      };
    };

    flatpak.enable = true;

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              # enter = "rightshift";
              # rightshift = "enter";
            };
          };
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = false;
    };

    packagekit.enable = true;
    fwupd.enable = true;
    colord.enable = false;
    printing.enable = false;
    accounts-daemon.enable = true;
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
}
