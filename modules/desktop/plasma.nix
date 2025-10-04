# modules/desktop/plasma.nix
{ pkgs, ... }:
{
  # Enable X11 and Plasma 6 with Wayland support
  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        settings = {
          # SDDM theming
          Theme = "breeze";
          Font = "JetBrains Mono,10,-1,5,50,0,0,0,0,0";
        };
      };
      desktopManager.plasma6.enable = true;

      # Keyboard configuration
      xkb = {
        layout = "us,ru";
        options = "eurosign:e,caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";
      };
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

  # Firefox with Wayland optimizations
  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal" = true;
      "gfx.webrender.all" = true;
      "media.ffmpeg.vaapi.enable" = true;
    };
    nativeMessagingHosts = {
      "org.kde.plasma.browser_integration" = true;
    };
  };

  # Additional Plasma packages at system level
  environment.systemPackages = with pkgs; [
    # Core Plasma components
    plasma6Packages.plasma-thunderbolt
    plasma6Packages.plasma-firewall
    plasma6Packages.plasma-vault
    plasma6Packages.plasma-workspace-wallpapers

    # System utilities
    plasma6Packages.systemsettings
    plasma6Packages.kde-inotify-survey
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
      xdg-desktop-portal-kde
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
