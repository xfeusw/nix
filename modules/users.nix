# modules/users.nix
{ pkgs, ... }:
{
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

  # Enable sudo without password for wheel group (optional)
  security.sudo.wheelNeedsPassword = false;
}
