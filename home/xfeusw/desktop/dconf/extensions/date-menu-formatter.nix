{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/date-menu-formatter" = {
      format = "%a %b %d, %Y %I:%M %p";
      advanced-formatter = false;
      text-alignment = "left";
      show-date = true;
      show-time = true;
    };
  };
}
