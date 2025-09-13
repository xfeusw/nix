# modules/desktop/plasma.nix
{ ... }:
{
  # Enable X11 and Plasma 6 with Wayland support
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "eurosign:e,caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";
      };
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    desktopManager.plasma6.enable = true;
    libinput.enable = true;

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
  };

  # Firefox with Wayland optimizations
  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal" = true;
      "gfx.webrender.all" = true;
    };
  };

  # Wayland environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
