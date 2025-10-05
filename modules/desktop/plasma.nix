# modules/desktop/plasma.nix
{ pkgs, ... }:
{
  # Enable Plasma 6 with Wayland support
  services = {
    xserver = {
      enable = true;
      # Keyboard configuration
      xkb = {
        layout = "us,ru";
        options = "eurosign:e,caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";
      };
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        settings = {
          # SDDM theming - proper INI format
          Theme = {
            Current = "breeze";
            Font = "JetBrains Mono,10,-1,5,50,0,0,0,0,0";
          };
        };
      };
    };

    desktopManager = {
      plasma6.enable = true;
    };

    # Audio configuration with PipeWire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Enable PackageKit for Discover to work properly
    packagekit.enable = true;

    # Printing service (optional)
    printing.enable = true;
  };

  # Network management
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Additional Plasma packages at system level
  environment.systemPackages = with pkgs; [
    # KDE Applications (Qt6-based)
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.okular
    kdePackages.ark
    kdePackages.kcalc

    # SDDM KCM (Qt6-based)
    kdePackages.sddm-kcm

    # Additional useful packages
    qt6.qtwayland             # Qt6 Wayland support
  ];

  # Wayland environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    GDK_BACKEND = "wayland,x11";

    # Plasma-specific variables
    KDE_SESSION_VERSION = "6";
    XDG_CURRENT_DESKTOP = "KDE";
  };

  # XDG portals for better integration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "kde"
          "gtk"
        ];
      };
    };
  };
}
