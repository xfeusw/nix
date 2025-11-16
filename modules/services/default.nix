{lib, ...}: {
  # System-wide programs
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  services.accounts-daemon.enable = lib.mkForce true;
  services.geoclue2.enable = false;
  services.fwupd.enable = false;
}
