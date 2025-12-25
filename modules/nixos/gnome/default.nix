{...}: {
  services = {
    xserver = {
      displayManager = {
        gdm = {
          enable = true;
        };
        gnome = {
          enable = true;
        };
      };
    };
  };
}
