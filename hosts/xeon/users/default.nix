{pkgs, ...}: {
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
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = true;
}
