{ ... }:
let
  wallpaperPath = ../../../../wallpaper/elizabeth.jpg;
in
{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${wallpaperPath}";
      picture-uri-dark = "file://${wallpaperPath}";
      picture-options = "zoom";
    };
  };
}
