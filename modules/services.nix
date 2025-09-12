# modules/services.nix
{ ... }:
{
  # Essential services
  services = {
    # Database (optional, uncomment if needed)
    # postgresql.enable = true;

    # Printing
    printing = {
      enable = true;
      drivers = [ ];
    };

    # Scanner support
    sane.enable = true;

    # Location services
    geoclue2.enable = true;
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh.enable = true;
  };
}
