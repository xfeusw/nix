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
      "podman"
      "lp"
      "adbusers"
      "plugdev"
    ];
    shell = "${pkgs.zsh}/bin/zsh";
  };

  security.sudo.wheelNeedsPassword = true;
}
