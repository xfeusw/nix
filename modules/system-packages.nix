# modules/system-packages.nix
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    wget
    git
    gh
    home-manager
    docker-client
    docker-compose
    xclip

    # KDE system integration
    kdePackages.kio-fuse # to mount remote filesystems via FUSE
    kdePackages.kio-extras # extra protocols support (sftp, fish and more)

    # Essential KDE applications
    kdePackages.dolphin # File manager
    kdePackages.konsole # Terminal emulator
    kdePackages.kate # Advanced text editor
    kdePackages.okular # Document viewer (PDF, etc.)
    kdePackages.gwenview # Image viewer
    kdePackages.spectacle # Screenshot tool
    kdePackages.ark # Archive manager
    kdePackages.kcalc # Calculator

    # KDE system tools
    kdePackages.systemsettings # System settings
    kdePackages.kinfocenter # System information
    kdePackages.partitionmanager # Disk partition manager
    kdePackages.discover # Software center
    kdePackages.plasma-systemmonitor # System monitor
    kdePackages.kwalletmanager # Password manager

    # KDE utilities
    kdePackages.kfind # File search tool
    kdePackages.kcharselect # Character selector
    kdePackages.kruler # Screen ruler
    kdePackages.ksystemlog # System log viewer
    kdePackages.kdialog # Dialog utility for scripts

    # Multimedia (KDE)
    kdePackages.elisa # Music player
    kdePackages.dragon # Video player (simple)
    # kdePackages.kamoso # Webcam application

    # Network tools (KDE)
    kdePackages.krdc # Remote desktop client
    kdePackages.krfb # Desktop sharing server

    # Development tools (KDE-aware)
    kdePackages.kdevelop # IDE
    # kdePackages.umbrello # UML modeler

    # Additional system integration
    kdePackages.kdeconnect-kde # Phone integration
    kdePackages.kio-admin # Admin privileges for file operations
    kdePackages.kio-gdrive # Google Drive integration
  ];
}
