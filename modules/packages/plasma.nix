# modules/packages/plasma.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # KDE Plasma applications
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.kate
    kdePackages.okular
    kdePackages.gwenview
    kdePackages.spectacle
    kdePackages.ark
    kdePackages.kcalc
    kdePackages.systemsettings
    kdePackages.kinfocenter
    kdePackages.partitionmanager
    kdePackages.discover
    kdePackages.plasma-systemmonitor
    kdePackages.kwalletmanager
    kdePackages.kfind
    kdePackages.kcharselect
    kdePackages.kruler
    kdePackages.ksystemlog
    kdePackages.elisa
    kdePackages.kdeconnect-kde

    # KDE system integration
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
  ];
}
