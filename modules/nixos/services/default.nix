{
  lib,
  pkgs,
  inputs,
  ...
}: {
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
          ids = ["*"];
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

    blueman.enable = true;

    packagekit.enable = lib.mkForce false;
    fwupd.enable = lib.mkForce false;
    colord.enable = lib.mkForce false;
    printing.enable = lib.mkForce false;
    accounts-daemon.enable = lib.mkForce true;

    # relago.enable = true;

    # main = {
    #   enable = true;
    #   user = "xfeusw";
    #   group = "wheel";
    # };
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # systemd.services = {
  #   py-flake = {
  #     enable = true;
  #     package = inputs.py-flake.packages.${pkgs.system}.main;
  #   };
  # };

  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = "1";
  #   MOZ_ENABLE_WAYLAND = "1";
  #   QT_QPA_PLATFORM = "wayland;xcb";
  #   GDK_BACKEND = "wayland,x11";
  #   KDE_SESSION_VERSION = "6";
  #   XDG_CURRENT_DESKTOP = "KDE";
  # };
}
