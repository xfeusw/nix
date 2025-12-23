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
      "lp"
    ];
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = true;
}
