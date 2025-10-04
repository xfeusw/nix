# home/xfeusw/desktop/plasma/packages.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Core Plasma components
    plasma6Packages.plasma-browser-integration
    plasma6Packages.plasma-pa
    plasma6Packages.plasma-thunderbolt
    plasma6Packages.plasma-vault
    plasma6Packages.plasma-workspace-wallpapers
    plasma6Packages.kde-cli-tools
    plasma6Packages.kio-extras
    plasma6Packages.kmenuedit
    plasma6Packages.systemsettings

    # Essential KDE Applications
    kdeApplications.kate
    kdeApplications.ark
    kdeApplications.gwenview
    kdeApplications.okular
    kdeApplications.kcalc
    kdeApplications.kcharselect
    kdeApplications.kcolorchooser
    kdeApplications.kgpg
    kdeApplications.kfind
    kdeApplications.kruler
    kdeApplications.ktimer
    kdeApplications.kwrite

    # Multimedia
    kdeApplications.dragon-player
    kdeApplications.elisa

    # System utilities
    kdeApplications.sweeper
    kdeApplications.khelpcenter
    kdeApplications.kio-admin
    kdeApplications.kde-inotify-survey

    # Themes and icons
    breeze-qt5
    breeze-gtk
    breeze-icons
    bibata-cursors

    # Development and customization
    kdeApplications.lokalize
    kdeApplications.poxml
  ];
}
