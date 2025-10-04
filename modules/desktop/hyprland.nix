{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Essential Wayland components
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty

    # App launcher
    wofi

    # Notifications
    mako

    # Bar
    waybar

    # Wallpaper
    hyprpaper

    # Screenshot
    grim
    slurp

    # Screen sharing
    xdg-desktop-portal-hyprland

    # Clipboard
    wl-clipboard

    # File manager
    nautilus

    # Network manager applet
    networkmanagerapplet

    # Bluetooth manager
    blueman

    # Audio control
    pavucontrol
  ];

  # XDG portals for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.hyprland ];
  };

  # Audio with PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Display manager - SDDM for Wayland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Enable polkit for authentication
  security.polkit.enable = true;

  # Polkit authentication agent
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Environment variables for Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_NO_HARDWARE_CURSORS = "1"; # Helps with NVIDIA
  };

  # NVIDIA-specific Hyprland environment variables
  environment.sessionVariables.WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
}
