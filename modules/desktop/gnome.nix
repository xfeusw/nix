# modules/desktop/gnome.nix
{ pkgs, ... }:
{
  # Enable GNOME with Wayland
  services.xserver = {
    enable = true; # Still needed for compatibility with some applications
    displayManager.gdm = {
      enable = true;
      wayland = true; # Explicitly enable Wayland
    };
    desktopManager.gnome = {
      enable = true;
    };

    # Keyboard configuration
    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle,grp:win_space_toggle,caps:escape,eurosign:e";
    };
  };

  # Audio with PipeWire (Wayland-compatible)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Touchpad support
  services.libinput.enable = true;

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    dconf-editor
  ];

  # Remove default GNOME applications not needed
  environment.gnome.excludePackages = with pkgs; [
    epiphany # GNOME web browser (you have Firefox)
    geary    # Email client
    gnome-music
    gnome-photos
    totem    # Video player (you have VLC/MPV)
  ];

  # Enable Firefox with Wayland optimizations
  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal" = true;
      "gfx.webrender.all" = true;
      "mozilla.widget.use-wayland" = 1; # Explicit Wayland support
    };
  };

  # Enable Wayland environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Enable Wayland for applications
    MOZ_ENABLE_WAYLAND = "1"; # Firefox Wayland support
    GDK_BACKEND = "wayland"; # Force GTK applications to use Wayland
    QT_QPA_PLATFORM = "wayland"; # Force Qt applications to use Wayland
    SDL_VIDEODRIVER = "wayland"; # SDL applications use Wayland
    XDG_SESSION_TYPE = "wayland"; # Set session type to Wayland

    GTK_THEME = "Adwaita-dark";

    QT_STYLE_OVERRIDE = "Adwaita-Dark";
  };

  # GNOME keyring
  services.gnome.gnome-keyring.enable = true;

  # Flatpak support (Wayland-compatible)
  services.flatpak.enable = true;

  # Enable location services for automatic timezone
  services.geoclue2.enable = true;
}
