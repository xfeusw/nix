# home/xfeusw/desktop/plasma/workspace.nix
{ ... }:
{
  programs.plasma = {
    workspace = {
      # Theme and appearance
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      cursorTheme = "Bibata-Modern-Ice";
      splashScreen = "None";

      # Wallpaper configuration
      wallpaper = "${./wallpaper/elizabeth.jpg}";

      # Optional: Multiple wallpapers for slideshow
      # wallpaper = [
      #   "${./wallpaper/elizabeth.jpg}"
      #   "${./wallpaper/another.jpg}"
      # ];
      # wallpaperMode = "Slideshow";
      # wallpaperDuration = 300;
    };

    # Hotkeys - disable conflicting ones for Hyprland compatibility
    hotkeys.commands."launch" = { };

    # Application launcher (Kickoff)
    kickoff = {
      favorites = [
        "org.kde.dolphin.desktop"
        "org.kde.konsole.desktop"
        "firefox.desktop"
        "org.kde.kate.desktop"
        "systemsettings.desktop"
        "org.kde.discover.desktop"
      ];
    };
  };

  # Environment variables for Plasma workspace
  home.sessionVariables = {
    KDE_SESSION_VERSION = "6";
    XDG_CURRENT_DESKTOP = "KDE";
    QT_QPA_PLATFORM = "wayland;xcb";
  };
}
