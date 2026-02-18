{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    e-imzo
    e-imzo-manager
  ];

  services.e-imzo.enable = true;
}
