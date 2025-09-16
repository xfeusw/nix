{ ... }:
{
  dconf.settings = {
    "org/gnome/desktop/default-applications/terminal" = {
      exec = "ghostty";
      exec-arg = "--single-instance";
    };
  };
}
