{...}: {
  services = {
    displayManager = {
      cosmic-greeter = {
        enable = true;
      };
    };

    desktopManager = {
      cosmic = {
        enable = true;
      };
    };

    system76-scheduler.enable = true;
  };

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
