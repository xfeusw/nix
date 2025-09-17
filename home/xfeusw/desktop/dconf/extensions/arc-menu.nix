# home/xfeusw/desktop/dconf/extensions/arc-menu.nix
{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/arc-menu" = {
      # General settings
      menu-layout = "Windows";              # Use a Windows-like menu layout (grid with pinned apps)
      menu-height = 600;                    # Menu height in pixels
      menu-width = 450;                     # Menu width in pixels
      show-categories = true;               # Show application categories
      show-quicklinks = true;               # Show quick links (Home, Documents, etc.)
      category-icon-size = 24;              # Size of category icons
      app-icon-size = 32;                   # Size of application icons
      override-menu-theme = true;           # Allow custom theming

      # Menu button customization
      menu-button-position = "Panel";       # Place button in panel (compatible with dash-to-panel)
      menu-button-icon = "System";          # Use default system icon (e.g., GNOME logo)
      menu-button-text = "Menu";            # Text for the menu button
      menu-button-icon-size = 20;           # Menu button icon size
      show-menu-button-arrow = false;       # Hide the arrow next to the button

      # Hotkeys and behavior
      enable-menu-hotkey = true;            # Enable hotkey
      menu-hotkey = "<Super>";              # Open menu with Super key
      open-on-hover = false;                # Disable hover to open (prevents accidental triggers)
      menu-button-click-action = "Menu";    # Clicking button opens menu

      # Search settings
      searchbar-default-top = true;         # Place search bar at the top
      searchbar-expanded = true;            # Keep search bar expanded
      searchbar-icon-size = 24;             # Icon size in search results
      search-provider = true;               # Enable external search providers

      # Pinned applications
      pinned-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
        "code.desktop"
        "spotify.desktop"
        "org.telegram.desktop.desktop"
        "dev.zed.Zed.desktop"
      ];                                    # Match your favorite-apps from shell.nix

      # Advanced features
      show-power-options = true;            # Show power options in menu
      show-user-icon = true;               # Show user avatar
      enable-vertical-separator = true;    # Add separator between sections

      # Theming to match Adwaita-dark
      menu-background-color = "#1e1e2e";   # Dark background to match Adwaita-dark
      menu-foreground-color = "#c0caf5";   # Light text/icons to match your Ghostty theme
      menu-border-radius = 10;             # Rounded corners
      menu-opacity = 0.95;                 # Slightly transparent menu
    };
  };
}
