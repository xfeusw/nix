{
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";
      };
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              enter = "rightshift";
              rightshift = "enter";
            };
          };
        };
      };
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings.Theme = {
        Current = "breeze";
        Font = "JetBrains Mono,10,-1,5,50,0,0,0,0,0";
      };
    };

    desktopManager.plasma6.enable = true;

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
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.ark
    kdePackages.kcalc
    kdePackages.sddm-kcm
    qt6.qtwayland
    kdePackages.xdg-desktop-portal-kde
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    GDK_BACKEND = "wayland,x11";
    KDE_SESSION_VERSION = "6";
    XDG_CURRENT_DESKTOP = "KDE";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    config.common.default = ["kde" "gtk"];
  };

  boot.kernel.sysctl = {
    "vm.dirty_ratio" = lib.mkForce 3;
    "vm.dirty_background_ratio" = lib.mkForce 1;
  };
}
