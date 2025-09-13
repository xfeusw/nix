# modules/services/system-programs.nix
{ ... }:
{
  # System-wide programs
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };
}
