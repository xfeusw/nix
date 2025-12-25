{lib, ...}: {
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };

  services = {
    accounts-daemon.enable = lib.mkForce true;
    # geoclue2.enable = false;
    fwupd.enable = false;
  };
}
