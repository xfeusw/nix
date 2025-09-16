{ ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "dev.zed.Zed.desktop"
        "com.mitchellh.ghostty.desktop"
        "code.desktop"
        "spotify.desktop"
        "org.telegram.desktop.desktop"
      ];
      enabled-extensions = [
        "dash-to-panel@jderose9.github.com"
        "appindicator@ubuntu.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "gsconnect@andyholmes.github.io"
        "caffeine@patapon.info"
        "arcmenu@arcmenu.com"
        "tiling-assistant@leleat-on-github"
        "date-menu-formatter@marcinjakubowski.github.com"
        "top-icons-plus@lehmann.rocks"
        "sound-output-device-chooser@kgshank.net"
        "coverflowalt-tab@palatis.blogspot.com"
        "just-perfection-desktop@just-perfection"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
      ];
    };
  };
}
