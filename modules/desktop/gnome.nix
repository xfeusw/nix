# modules/desktop/gnome.nix
{ pkgs, ... }:
{
  # Enable X11 and GNOME
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Keyboard configuration
    xkb = {
      layout = "us,ru";
      options = "eurosign:e,caps:escape,grp:alt_shift_toggle,grp:win_space_toggle";
    };
  };

  # Audio with PipeWire (better than PulseAudio)
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

  # Remove some default GNOME applications you might not want
  environment.gnome.excludePackages = with pkgs; [
    epiphany # GNOME web browser (you have Firefox)
    geary    # Email client
    gnome-music
    gnome-photos
    totem    # Video player (you have VLC/MPV)
  ];

  # Enable GNOME programs
  programs.firefox.enable = true;

  # GNOME keyring
  services.gnome.gnome-keyring.enable = true;

  # Flatpak support (optional, good for GNOME apps)
  services.flatpak.enable = true;

  # Enable location services for automatic timezone
  services.geoclue2.enable = true;
}
