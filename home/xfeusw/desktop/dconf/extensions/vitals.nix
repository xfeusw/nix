{ ... }:
{
  dconf.settings = {
    "org/gnome/shell/extensions/vitals" = {
      show-cpu = true;
      show-memory = true;
      show-disk = true;
      show-network = true;
      show-temperature = true;
      show-fan = false;
      position-in-panel = "right";
      update-time = 2;
      use-higher-precision = true;
    };
  };
}
