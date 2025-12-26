{pkgs, ...}: {
  users.groups.plugdev = {};

  users.users.xfeusw = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "libvirtd"
      "scanner"
      "kvm"
      "lp"
      "adbusers"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = true;
}
