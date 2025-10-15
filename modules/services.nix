{...}: {
  # System-wide programs
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  services.accounts-daemon.enable = false;
  services.geoclue2.enable = false;
  services.packagekit.enable = false;
  services.fwupd.enable = false;
}
