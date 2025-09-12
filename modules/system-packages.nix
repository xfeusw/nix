# modules/system-packages.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    git
    wget
    curl
    home-manager
    xclip
    wl-clipboard

    # Modern CLI tools
    bat # Better cat
    eza # Better ls
    fd # Better find
    ripgrep # Better grep
    zoxide # Smart cd
    fzf # Fuzzy finder
    btop # Better top
    dust # Better du
    procs # Better ps

    # Development essentials
    gh # GitHub CLI
    lazygit # Git TUI
    docker-compose

    # System tools
    htop
    iotop
    lsof
    strace
    sysstat
    usbutils
    pciutils

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

    # Media and graphics
    vlc
    mpv
    gimp
    inkscape
    obs-studio
  ];

  # Font configuration
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}
